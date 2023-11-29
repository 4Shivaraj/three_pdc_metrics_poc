
view: map_mapping_details {
  derived_table: {
    sql: WITH
          MasterData AS (
            SELECT
              *,
              CASE
                WHEN {{ three_pdc_metrics_demo.param_duration_type._parameter_value }} = 'Year' THEN year_start_date
                WHEN {{ three_pdc_metrics_demo.param_duration_type._parameter_value }} = 'Quarter' THEN quarter_start_date
                WHEN {{ three_pdc_metrics_demo.param_duration_type._parameter_value }} = 'Month' THEN month_start_date
                WHEN {{ three_pdc_metrics_demo.param_duration_type._parameter_value }} = 'Week' THEN week_start_date
                ELSE year_start_date
              END AS duration_date
              FROM `@{GCP_PROJECT}.@{REPORTING_DATASET}.three_pdc_metrics_demo`),
          PivotMasterData AS (
            SELECT
              'Data Security' AS data_source,
              region,
              metro,
              duration_date,
              latitude,
              longitude,
              1 AS target,
              ds_hwops_violations AS numerator,
              ds_processed_count AS denominator
            FROM MasterData
            WHERE ds_hwops_violations IS NOT NULL OR ds_processed_count IS NOT NULL
            UNION ALL
            SELECT
              'Machine Maintenance Tier 1' AS data_source,
              region,
              metro,
              duration_date,
              latitude,
              longitude,
              0.99 AS target,
              mmt1_slo_sum AS numerator,
              mmt1_slo_count AS denominator
            FROM MasterData
            WHERE mmt1_slo_count IS NOT NULL OR mmt1_slo_sum IS NOT NULL
            UNION ALL
            SELECT
              'Machine Maintenance Tier 2 & 3' AS data_source,
              region,
              metro,
              duration_date,
              latitude,
              longitude,
              0.99 AS target,
              mmt23_slo_sum AS numerator,
              mmt23_slo_count AS denominator
            FROM MasterData
            WHERE mmt23_slo_count IS NOT NULL OR mmt23_slo_sum IS NOT NULL
            UNION ALL
            SELECT
              'Machine Maintenance ServOps' AS data_source,
              region,
              metro,
              duration_date,
              latitude,
              longitude,
              0.99 AS target,
              mm_svops_slo_sum AS numerator,
              mm_svops_slo_count AS denominator
            FROM MasterData
            WHERE mm_svops_slo_count IS NOT NULL OR mm_svops_slo_sum IS NOT NULL
            UNION ALL
            SELECT
              'Edge Repair' AS data_source,
              region,
              metro,
              duration_date,
              latitude,
              longitude,
              0.85 AS target,
              er_in_slo AS numerator,
              er_total AS denominator
            FROM MasterData
            WHERE er_in_slo IS NOT NULL OR er_total IS NOT NULL
            UNION ALL
            SELECT
              'Interrupts' AS data_source,
              region,
              metro,
              duration_date,
              latitude,
              longitude,
              0.85 AS target,
              irpt_slo_met AS numerator,
              irpt_total_bugs AS denominator
            FROM MasterData
            WHERE irpt_slo_met IS NOT NULL OR irpt_total_bugs IS NOT NULL
            UNION ALL
            SELECT
              'Builds Cycle Time' AS data_source,
              region,
              metro,
              duration_date,
              latitude,
              longitude,
              0.95 AS target,
              bct_met_count AS numerator,
              bct_total_count AS denominator
            FROM MasterData
            WHERE bct_met_count IS NOT NULL OR bct_total_count IS NOT NULL
            UNION ALL
            SELECT
              'Build OTD' AS data_source,
              region,
              metro,
              duration_date,
              latitude,
              longitude,
              0.9 AS target,
              botd_met_count AS numerator,
              botd_total_count AS denominator
            FROM MasterData
            WHERE botd_met_count IS NOT NULL OR botd_total_count IS NOT NULL
            UNION ALL
            SELECT
              'Bug Management' AS data_source,
              region,
              metro,
              duration_date,
              latitude,
              longitude,
              0.97 AS target,
              bm_escalated_cnt AS numerator,
              bm_closed_cnt AS denominator
            FROM MasterData
            WHERE bm_escalated_cnt IS NOT NULL OR bm_closed_cnt IS NOT NULL
            UNION ALL
            SELECT
              'Data Security RCA' AS data_source,
              region,
              metro,
              duration_date,
              latitude,
              longitude,
              1 AS target,
              ds_rca_root_cause_met_sli_sum AS numerator,
              ds_rca_root_cause_met_sli_count AS denominator
            FROM MasterData
            WHERE ds_rca_root_cause_met_sli_sum IS NOT NULL OR ds_rca_root_cause_met_sli_count IS NOT NULL
          ),
          SloMetrics AS (
            SELECT
              data_source,
              region,
              metro,
              duration_date,
              latitude,
              longitude,
              target,
              SUM(numerator) AS numerator,
              SUM(denominator) AS denominator,
              ROUND((SUM (numerator)/SUM(denominator)), 2) AS map_metric,
              IF(
              data_source IN (
              'Machine Maintenance Tier 1', 'Machine Maintenance Tier 2 & 3',
              'Machine Maintenance ServOps', 'Bug Management', 'Data Security'),
               1.0 - SAFE_DIVIDE(SUM(numerator), SUM(denominator)),
              SAFE_DIVIDE(SUM (numerator), SUM(denominator))) AS slo_score_base,
            FROM PivotMasterData
            GROUP BY 1, 2, 3, 4, 5, 6, 7
            )
            SELECT *
            FROM SloMetrics
            WHERE slo_score_base < target
            ORDER BY 1, 2, 3 ;;
  }

  dimension_group: duration {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.duration_date ;;
  }

  dimension: data_source {
    type: string
    sql: ${TABLE}.data_source ;;
  }
  dimension: region {
    type: string
    sql: ${TABLE}.region ;;
    hidden: no
  }
  dimension: metro {
    type: string
    sql: ${TABLE}.metro ;;
    hidden: no
  }
  dimension: latitude {
    type: number
    sql: ${TABLE}.latitude ;;
    hidden: no
  }
  dimension: longitude {
    type: number
    sql: ${TABLE}.longitude ;;
    hidden: no
  }
  dimension: target {
    type: number
    sql: ${TABLE}.target ;;
    hidden: no
  }
  dimension: numerator {
    type: number
    sql: ${TABLE}.numerator ;;
    hidden: no
  }
  dimension: denominator {
    type: number
    sql: ${TABLE}.denominator ;;
    hidden: no
  }
  dimension: map_metric {
    type: number
    sql: ${TABLE}.map_metric ;;
    hidden: no
  }
  dimension: slo_score_base {
    type: number
    sql: ${TABLE}.slo_score_base ;;
    hidden: no
  }
  measure: ooslo_metric_size {
    type: number
    sql: LOG(100 + ${map_metric}) ;;
    value_format_name: decimal_4
    hidden: no
  }
}
