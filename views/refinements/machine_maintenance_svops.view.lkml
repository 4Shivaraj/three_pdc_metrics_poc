########################################################################################################
# Update Log:
#   29/11/2023 — Machine Maintenance ServOps
########################################################################################################

########################################################################################################
# Description:
#   Purpose of this table is to include all the details of Machine Maintenance Server operations
########################################################################################################

include: "/views/refinements/*.view.lkml"

view: +three_pdc_metrics_demo{


##### DIMENSIONS

  dimension: mm_svops_detail_data {
    sql: ${TABLE}.mm_svops_detail_data ;;
    view_label: "Machine Maintenance Server Ops"
    hidden: yes
  }
  dimension: mm_svops_summary_data {
    sql: ${TABLE}.mm_svops_summary_data ;;
    view_label: "Machine Maintenance Server Ops"
    hidden: yes
  }
  dimension: mmtso_slo_count {
    type: number
    sql: ${TABLE}.mm_svops_slo_count ;;
    view_label: "Machine Maintenance Server Ops"
    hidden: no
  }
  dimension: mmtso_slo_sum {
    type: number
    sql: ${TABLE}.mm_svops_slo_sum ;;
    view_label: "Machine Maintenance Server Ops"
    hidden: no
  }

##### MEASURES

  measure: mmso_slo_average_score {
    type: number
    sql: ROUND((1.0 - SAFE_DIVIDE(SUM(${mmtso_slo_sum}), SUM(${mmtso_slo_count}))) * 100,2);;
    html:
      {% if value >= 99 %}
      <p style="color: black; background-color: #4285f4;">{{ value }}%</p>
      {% elsif value < 99 %}
      <p style="color: black; background-color: #fbc02d;">{{ value }}%</p>
      {% elsif value < 95 %}
      <p style="color: black; background-color: #db4437;">{{ value }}%</p>
      {% endif %}
      ;;
    link: {
      label: "3PDC Machine Maintenance Server Ops"
      url: "https://69af6669-814a-475b-8caf-6e43a13b16e2.looker.app/dashboards/25?&Region={{ _filters['three_pdc_metrics_demo.region']| url_encode }}&Metro={{ _filters['three_pdc_metrics_demo.metro']| url_encode }}"
    }
    value_format: "0.00\%"
    label: "MM ServOps SLO Avg Score (Target: 99%)"
    view_label: "Machine Maintenance Server Ops"
    hidden: no
  }
}

view: _mm_svops_detail_data {


##### DIMENSIONS

  dimension: bug_id {
    type: string
    sql: _mm_svops_detail_data.bug_id ;;
    view_label: "Machine Maintenance Server Ops"
    hidden: no
  }
  dimension: hwops_availability_score {
    type: number
    sql: _mm_svops_detail_data.hwops_availability_score ;;
    view_label: "Machine Maintenance Server Ops"
    hidden: no
  }
  dimension: metro_tier {
    type: string
    sql: _mm_svops_detail_data.metro_tier ;;
    view_label: "Machine Maintenance Server Ops"
    hidden: no
  }
  dimension: pool {
    type: string
    sql: _mm_svops_detail_data.pool ;;
    view_label: "Machine Maintenance Server Ops"
    hidden: no
  }
  dimension: slip_category {
    type: string
    sql: _mm_svops_detail_data.slip_category ;;
    view_label: "Machine Maintenance Server Ops"
    hidden: no
  }
  dimension: slip_note {
    type: string
    sql: _mm_svops_detail_data.slip_note ;;
    view_label: "Machine Maintenance Server Ops"
    hidden: no
  }
  dimension: slip_source {
    type: string
    sql: _mm_svops_detail_data.slip_source ;;
    view_label: "Machine Maintenance Server Ops"
    hidden: no
  }
  dimension: slip_type {
    type: string
    sql: _mm_svops_detail_data.slip_type ;;
    view_label: "Machine Maintenance Server Ops"
    hidden: no
  }
}

view: _mm_svops_summary_data {

##### DIMENSIONS

  dimension: hwops_time_above_buffer {
    type: number
    sql: _mm_svops_summary_data.hwops_time_above_buffer ;;
    view_label: "Machine Maintenance Server Ops Summary"
    hidden: no
  }
  dimension: metro_tier {
    type: string
    sql: _mm_svops_summary_data.metro_tier ;;
    view_label: "Machine Maintenance Server Ops Summary"
    hidden: no
  }
  dimension: svops_total_time {
    type: number
    sql: _mm_svops_summary_data.total_time ;;
    view_label: "Machine Maintenance Server Ops Summary"
    hidden: no
  }

##### MEASURES

  measure: slo_average_time {
    type: number
    # ROUND((1.0 - SAFE_DIVIDE(SUM(${mmtso_slo_sum}), SUM(${mmtso_slo_count}))) * 100,2);;
    sql: ROUND((1.0 - (AVG(CAST((${hwops_time_above_buffer}) AS FLOAT64) / CAST((${svops_total_time}) AS FLOAT64)))) * 100, 2) ;;
    value_format: "0.00\%"
    view_label: "Machine Maintenance Server Ops Summary"
    hidden: no
  }
  measure: ooslo_average_time {
    type: number
    sql: ROUND((AVG(CAST((${hwops_time_above_buffer}) AS FLOAT64) / CAST((${svops_total_time}) AS FLOAT64))) * 100, 2) ;;
    value_format: "0.00\%"
    view_label: "Machine Maintenance Server Ops Summary"
    hidden: no
  }
  measure: servops_target {
    type: number
    sql: 0.99 * 100 ;;
    value_format: "0.00\%"
    view_label: "Machine Maintenance Server Ops Summary"
    hidden: no
  }
}
