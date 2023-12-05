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
    hidden: yes
    sql: ${TABLE}.mm_svops_detail_data ;;
  }
  dimension: mm_svops_summary_data {
    hidden: yes
    sql: ${TABLE}.mm_svops_summary_data ;;
  }
  dimension: mmtso_slo_count {
    type: number
    sql: ${TABLE}.mm_svops_slo_count ;;
    hidden: no
    view_label: "Machine Maintenance Server Ops"
  }
  dimension: mmtso_slo_sum {
    type: number
    sql: ${TABLE}.mm_svops_slo_sum ;;
    hidden: no
    view_label: "Machine Maintenance Server Ops"
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
    hidden: no
    value_format: "0.00\%"
    view_label: "Machine Maintenance Server Ops"
    label: "MM ServOps SLO Avg Score (Target: 99%)"
  }
}

view: _mm_svops_detail_data {


##### DIMENSIONS

  dimension: bug_id {
    type: string
    sql: _mm_svops_detail_data.bug_id ;;
    hidden: no
  }
  dimension: hwops_availability_score {
    type: number
    sql: _mm_svops_detail_data.hwops_availability_score ;;
    hidden: no
  }
  dimension: metro_tier {
    type: string
    sql: _mm_svops_detail_data.metro_tier ;;
    hidden: no
  }
  dimension: pool {
    type: string
    sql: _mm_svops_detail_data.pool ;;
    hidden: no
  }
  dimension: slip_category {
    type: string
    sql: _mm_svops_detail_data.slip_category ;;
    hidden: no
  }
  dimension: slip_note {
    type: string
    sql: _mm_svops_detail_data.slip_note ;;
    hidden: no
  }
  dimension: slip_source {
    type: string
    sql: _mm_svops_detail_data.slip_source ;;
    hidden: no
  }
  dimension: slip_type {
    type: string
    sql: _mm_svops_detail_data.slip_type ;;
    hidden: no
  }
}

view: _mm_svops_summary_data {

##### DIMENSIONS

  dimension: hwops_time_above_buffer {
    type: number
    sql: _mm_svops_summary_data.hwops_time_above_buffer ;;
    hidden: no
  }
  dimension: metro_tier {
    type: string
    sql: _mm_svops_summary_data.metro_tier ;;
    hidden: no
  }
  dimension: svops_total_time {
    type: number
    sql: _mm_svops_summary_data.total_time ;;
    hidden: no
  }

##### MEASURES

  measure: slo_average_time {
    type: number
    # ROUND((1.0 - SAFE_DIVIDE(SUM(${mmtso_slo_sum}), SUM(${mmtso_slo_count}))) * 100,2);;
    sql: ROUND((1.0 - (AVG(CAST((${hwops_time_above_buffer}) AS FLOAT64) / CAST((${svops_total_time}) AS FLOAT64)))) * 100, 2) ;;
    html:
    {% if value >= 99 %}
    <p style="color: black; background-color: #4285f4;">{{ value }}%</p>
    {% elsif value < 99 %}
    <p style="color: black; background-color: #fbc02d;">{{ value }}%</p>
    {% elsif value < 95 %}
    <p style="color: black; background-color: #db4437;">{{ value }}%</p>
    {% endif %}
    ;;
    hidden: no
    value_format: "0.00\%"
    # value_format_name: percent_0
    view_label: "Machine Maintenance Server Ops"
  }
  measure: ooslo_average_time {
    type: number
    sql: ROUND((AVG(CAST((${hwops_time_above_buffer}) AS FLOAT64) / CAST((${svops_total_time}) AS FLOAT64))) * 100, 2) ;;
    html:
    {% if value >= 5 %}
    <p style="color: black; background-color: #4285f4;">{{ value }}%</p>
    {% elsif value < 5 %}
    <p style="color: black; background-color: #fbc02d;">{{ value }}%</p>
    {% elsif value < 2 %}
    <p style="color: black; background-color: #db4437;">{{ value }}%</p>
    {% endif %}
    ;;
    hidden: no
    value_format: "0.00\%"
    view_label: "Machine Maintenance Server Ops"
  }
  measure: servops_target {
    type: number
    sql: 0.99 * 100 ;;
    html:
    {% if value >= 99 %}
    <p style="color: black; background-color: #4285f4;">{{ value }}%</p>
    {% elsif value < 99 %}
    <p style="color: black; background-color: #fbc02d;">{{ value }}%</p>
    {% elsif value < 95 %}
    <p style="color: black; background-color: #db4437;">{{ value }}%</p>
    {% endif %}
    ;;
    value_format: "0.00\%"
    hidden: no
    view_label: "Machine Maintenance Server Ops"
  }
}
