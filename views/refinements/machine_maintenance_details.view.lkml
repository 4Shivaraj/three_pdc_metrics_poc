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
    sql: ${TABLE}.mm_detail_data ;;
    view_label: "Machine Maintenance"
    hidden: yes
  }
  dimension: mm_summary_data {
    sql: ${TABLE}.mm_summary_data ;;
    view_label: "Machine Maintenance"
    hidden: yes
  }
  dimension: mmt1_slo_count {
    type: number
    sql: ${TABLE}.mmt1_slo_count ;;
    view_label: "Machine Maintenance"
    hidden: no
  }
  dimension: mmt1_slo_sum {
    type: number
    sql: ${TABLE}.mmt1_slo_sum ;;
    view_label: "Machine Maintenance"
    hidden: no
  }
  dimension: mmt23_slo_count {
    type: number
    sql: ${TABLE}.mmt23_slo_count ;;
    view_label: "Machine Maintenance"
    hidden: no
  }
  dimension: mmt23_slo_sum {
    type: number
    sql: ${TABLE}.mmt23_slo_sum ;;
    view_label: "Machine Maintenance"
    hidden: no
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
      url: "https://68d5f542-af0a-42c3-b66e-7d93874cb867.looker.app/dashboards/10?Region={{ _filters['three_pdc_metrics_demo.region']| url_encode }}&Metro={{ _filters['three_pdc_metrics_demo.metro']| url_encode }}&Duration%20Type={{ _filters['three_pdc_metrics_demo.param_duration_type']| url_encode }}&Duration%20Date={{ _filters['three_pdc_metrics_demo.p_duration_date']| url_encode }}&Metro%20Tier=Tier 1"
    }
    value_format: "0.00\%"
    label: "MM Tier1 SLO Avg Score (Target: 99%)"
    view_label: "Machine Maintenance"
    hidden: no
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
      url: "https://68d5f542-af0a-42c3-b66e-7d93874cb867.looker.app/dashboards/10?Region={{ _filters['three_pdc_metrics_demo.region']| url_encode }}&Metro={{ _filters['three_pdc_metrics_demo.metro']| url_encode }}&Duration%20Type={{ _filters['three_pdc_metrics_demo.param_duration_type']| url_encode }}&Duration%20Date={{ _filters['three_pdc_metrics_demo.p_duration_date']| url_encode }}&Metro%20Tier=Tier 2, Tier 3"
    }
    value_format: "0.00\%"
    label: "MM Tier 2&3 SLO Avg Score (Target: 99%)"
    view_label: "Machine Maintenance"
    hidden: no
  }

}

view: _mm_detail_data {


##### DIMENSIONS

  dimension: aging {
    type: number
    sql: _mm_detail_data.aging ;;
    view_label: "Machine Maintenance"
    hidden: no
  }
  dimension: bug_id {
    type: string
    sql: _mm_detail_data.bug_id ;;
    view_label: "Machine Maintenance"
    hidden: no
  }
  dimension: cluster {
    type: string
    sql: _mm_detail_data.cluster ;;
    view_label: "Machine Maintenance"
    hidden: no
  }
  dimension: gpn {
    type: string
    sql: _mm_detail_data.gpn ;;
    view_label: "Machine Maintenance"
    hidden: no
  }
  dimension: gpn_part_name {
    type: string
    sql: _mm_detail_data.gpn_part_name ;;
    view_label: "Machine Maintenance"
    hidden: no
  }
  dimension: is_test {
    type: string
    sql: _mm_detail_data.is_test ;;
    view_label: "Machine Maintenance"
    hidden: no
  }
  dimension: metro_tier {
    type: string
    sql: _mm_detail_data.metro_tier ;;
    view_label: "Machine Maintenance"
    hidden: no
  }
  dimension: pool {
    type: string
    sql: _mm_detail_data.pool ;;
    view_label: "Machine Maintenance"
    hidden: no
  }
  dimension: slip_category {
    type: string
    sql: _mm_detail_data.slip_category ;;
    view_label: "Machine Maintenance"
    hidden: no
  }
  dimension: slip_chart_order {
    type: number
    sql: _mm_detail_data.slip_chart_order ;;
    view_label: "Machine Maintenance"
    hidden: no
  }
  dimension: slip_note {
    type: string
    sql: _mm_detail_data.slip_note ;;
    view_label: "Machine Maintenance"
    hidden: no
  }
  dimension: slip_source {
    type: string
    sql: _mm_detail_data.slip_source ;;
    view_label: "Machine Maintenance"
    hidden: no
  }
  dimension: slip_type {
    type: string
    sql: _mm_detail_data.slip_type ;;
    view_label: "Machine Maintenance"
    hidden: no
  }
}

view: _mm_summary_data {

##### DIMENSIONS

  dimension: is_test {
    type: string
    sql: _mm_summary_data.is_test ;;
    view_label: "Machine Maintenance Summary"
    hidden: no
  }
  dimension: metro_tier {
    type: string
    sql: _mm_summary_data.metro_tier ;;
    view_label: "Machine Maintenance Summary"
    hidden: no
  }
  dimension: three_pdc_metrics_demo__mm_summary_data {
    type: string
    sql: three_pdc_metrics_demo__mm_summary_data ;;
    view_label: "Machine Maintenance Summary"
    hidden: yes
  }
  dimension: time_above_buffer {
    type: number
    sql: _mm_summary_data.time_above_buffer ;;
    view_label: "Machine Maintenance Summary"
    hidden: no
  }
  dimension: total_time {
    type: number
    sql: _mm_summary_data.total_time ;;
    view_label: "Machine Maintenance Summary"
    hidden: no
  }

##### MEASURES

  measure: slo_average_score {
    type: number
    sql: ROUND((1.0 - (AVG(CAST((${time_above_buffer}) AS FLOAT64) / CAST((${total_time}) AS FLOAT64)))) * 100, 2) ;;
    value_format: "0.00\%"
    view_label: "Machine Maintenance Summary"
    hidden: no
  }

  measure: ooslo_average_score {
    type: number
    sql: ROUND(AVG(CAST((${time_above_buffer}) AS FLOAT64) / CAST((${total_time}) AS FLOAT64))* 100, 2) ;;
    value_format: "0.00\%"
    label: "Out of SLO Average Score"
    view_label: "Machine Maintenance Summary"
    hidden: no
  }
  measure: target {
    type: number
    sql: 0.99 * 100 ;;
    value_format: "0.00\%"
    view_label: "Machine Maintenance Summary"
    hidden: no
  }
}
