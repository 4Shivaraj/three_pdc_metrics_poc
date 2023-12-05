########################################################################################################
# Update Log:
#   29/11/2023 — Machine Maintenance SLA Tier1 , Tier1 2&3
########################################################################################################

########################################################################################################
# Description:
#   Purpose of this table is to include all the details of Machine Maintenance SLA Tier1 , Tier1 2&3
########################################################################################################

include: "/views/refinements/*.view.lkml"

view: +three_pdc_metrics_demo{


##### DIMENSIONS

   dimension: mm_detail_data {
    hidden: yes
    sql: ${TABLE}.mm_detail_data ;;
  }
  dimension: mm_summary_data {
    hidden: yes
    sql: ${TABLE}.mm_summary_data ;;
  }
  dimension: mmt1_slo_count {
    type: number
    sql: ${TABLE}.mmt1_slo_count ;;
    hidden: yes
    view_label: "Machine Maintenance"
  }
  dimension: mmt1_slo_sum {
    type: number
    sql: ${TABLE}.mmt1_slo_sum ;;
    hidden: yes
    view_label: "Machine Maintenance"
  }
  dimension: mmt23_slo_count {
    type: number
    sql: ${TABLE}.mmt23_slo_count ;;
    hidden: yes
    view_label: "Machine Maintenance"
  }
  dimension: mmt23_slo_sum {
    type: number
    sql: ${TABLE}.mmt23_slo_sum ;;
    hidden: yes
    view_label: "Machine Maintenance"
  }

##### MEASURES

  measure: mmt1_slo_average_score_base {
    type: number
    sql: ROUND((1.0 - SAFE_DIVIDE(SUM(${mmt1_slo_sum}), SUM(${mmt1_slo_count}))) * 100, 2) ;;
    html:
    {% if value >= 99 %}
    <p style="color: black; background-color: #4285f4;">{{ value }}%</p>
    {% elsif value < 99 %}
    <p style="color: black; background-color: #fbc02d;">{{ value }}%</p>
    {% elsif value < 90 %}
    <p style="color: black; background-color: #db4437;">{{ value }}%</p>
    {% endif %}
    ;;
    link: {
      label: "3PDC Machine Maintenance"
      url: "https://68d5f542-af0a-42c3-b66e-7d93874cb867.looker.app/dashboards/6?Region={{ _filters['three_pdc_metrics_demo.region']| url_encode }}&Metro={{ _filters['three_pdc_metrics_demo.metro']| url_encode }}&Duration%20Type={{ _filters['three_pdc_metrics_demo.param_duration_type']| url_encode }}&Duration%20Date={{ _filters['three_pdc_metrics_demo.p_duration_date']| url_encode }}"

      }
    hidden: no
    value_format: "0.00\%"
    view_label: "Machine Maintenance"
    label: "MM Tier1 SLO Avg Score (Target: 99%)"
  }
  measure: mmt23_slo_average_score_base {
    type: number
    sql: ROUND((1.0 - SAFE_DIVIDE(SUM(${mmt23_slo_sum}), SUM(${mmt23_slo_count}))) * 100, 2) ;;
    html:
    {% if value >= 90 %}
    <p style="color: black; background-color: #4285f4;">{{ value }}%</p>
    {% elsif value < 90 %}
    <p style="color: black; background-color: #fbc02d;">{{ value }}%</p>
    {% elsif value < 85 %}
    <p style="color: black; background-color: #db4437;">{{ value }}%</p>
    {% endif %}
    ;;
    link: {
      label: "3PDC Machine Maintenance"
      url: "https://69af6669-814a-475b-8caf-6e43a13b16e2.looker.app/dashboards/24?&Region={{ _filters['three_pdc_metrics_demo.region']| url_encode }}&Metro={{ _filters['three_pdc_metrics_demo.metro']| url_encode }}"
    }
    hidden: no
    value_format: "0.00\%"
    view_label: "Machine Maintenance"
    label: "MM Tier 2&3 SLO Avg Score (Target: 99%)"
  }
}

view: _mm_detail_data {


##### DIMENSIONS

  dimension: aging {
    type: number
    sql: _mm_detail_data.aging ;;
    hidden: no
  }
  dimension: bug_id {
    type: string
    sql: _mm_detail_data.bug_id ;;
    hidden: no
  }
  dimension: cluster {
    type: string
    sql: _mm_detail_data.cluster ;;
    hidden: no
  }
  dimension: gpn {
    type: string
    sql: _mm_detail_data.gpn ;;
    hidden: no
  }
  dimension: gpn_part_name {
    type: string
    sql: _mm_detail_data.gpn_part_name ;;
    hidden: no
  }
  dimension: is_test {
    type: string
    sql: _mm_detail_data.is_test ;;
    hidden: no
  }
  dimension: metro_tier {
    type: string
    sql: _mm_detail_data.metro_tier ;;
    hidden: no
  }
  dimension: pool {
    type: string
    sql: _mm_detail_data.pool ;;
    hidden: no
  }
  dimension: slip_category {
    type: string
    sql: _mm_detail_data.slip_category ;;
    hidden: no
  }
  dimension: slip_chart_order {
    type: number
    sql: _mm_detail_data.slip_chart_order ;;
    hidden: no
  }
  dimension: slip_note {
    type: string
    sql: _mm_detail_data.slip_note ;;
    hidden: no
  }
  dimension: slip_source {
    type: string
    sql: _mm_detail_data.slip_source ;;
    hidden: no
  }
  dimension: slip_type {
    type: string
    sql: _mm_detail_data.slip_type ;;
    hidden: no
  }
}

view: _mm_summary_data {

##### DIMENSIONS

  dimension: is_test {
    type: string
    sql: _mm_summary_data.is_test ;;
    hidden: no
  }
  dimension: metro_tier {
    type: string
    sql: _mm_summary_data.metro_tier ;;
    hidden: no
  }
  dimension: three_pdc_metrics_demo__mm_summary_data {
    type: string
    hidden: yes
    sql: three_pdc_metrics_demo__mm_summary_data ;;
  }
  dimension: time_above_buffer {
    type: number
    sql: _mm_summary_data.time_above_buffer ;;
    hidden: no
  }
  dimension: total_time {
    type: number
    sql: _mm_summary_data.total_time ;;
    hidden: no
  }

##### MEASURES
  measure: ooslo_average_score {
    type: number
    sql: ROUND(AVG(CAST((${time_above_buffer}) AS FLOAT64) / CAST((${total_time}) AS FLOAT64))* 100, 2) ;;

    hidden: no
  }
  measure: target {
    type: number
    sql: 0.99 * 100 ;;
    value_format: "0.00\%"
    hidden: no
  }
}
