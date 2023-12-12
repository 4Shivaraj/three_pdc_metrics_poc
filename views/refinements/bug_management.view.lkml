########################################################################################################
# Update Log:
#   29/11/2023 — Bug Management
########################################################################################################

########################################################################################################
# Description:
#   Purpose of this table is to include all the details of Bug Management
########################################################################################################

include: "/views/refinements/*.view.lkml"

view: +three_pdc_metrics_demo{

##### DIMENSIONS

  dimension: bm_active_bugs_detail_data {
    sql: ${TABLE}.bm_active_bugs_detail_data ;;
    view_label: "Bug Management SLO"
    hidden: yes
  }
  dimension: bm_closed_count {
    type: number
    sql: ${TABLE}.bm_closed_cnt ;;
    view_label: "Bug Management SLO"
    hidden: yes
  }
  dimension: bm_escalated_count {
    type: number
    sql: ${TABLE}.bm_escalated_cnt ;;
    view_label: "Bug Management SLO"
    hidden: yes
  }

##### MEASURES

  measure: bm_slo_score {
    type: number
    sql: ROUND((1-SAFE_DIVIDE(SUM(${bm_escalated_count}), SUM(${bm_closed_count}))) *100,2) ;;
    html:
    {% if value >= 97 %}
    <p style="color: black; background-color: #4285f4;">{{ value }}%</p>
    {% elsif value < 97 %}
    <p style="color: black; background-color: #fbc02d;">{{ value }}%</p>
    {% elsif value < 90 %}
    <p style="color: black; background-color: #db4437;">{{ value }}%</p>
    {% endif %}
    ;;
    link: {
      label: "3PDC Bug Management SLO"
      url: "/dashboards/three_pdc_metrics_poc::3pdc_bug_management?Region={{ _filters['three_pdc_metrics_demo.region']| url_encode }}&Metro={{ _filters['three_pdc_metrics_demo.metro']| url_encode }}&Duration%20Type={{ _filters['three_pdc_metrics_demo.param_duration_type']| url_encode }}&Duration%20Date={{ _filters['three_pdc_metrics_demo.p_duration_date']| url_encode }}"
    }
    value_format: "0.00\%"
    label: "Bug Managemnet SLO Score (Target: 97%)"
    view_label: "Bug Management SLO"
    hidden: no

  }
  measure: global {
    type: number
    sql: ${bm_slo_score};;
    view_label: "Bug Management SLO"
    hidden: no
  }

  measure: bm_target {
    type: number
    sql: 0.90 * 100 ;;
    value_format: "0.00\%"
    label: "Target"
    view_label: "Bug Management SLO"
    hidden: no
  }
}

view: _bm_active_bugs_detail_data {

##### DIMENSIONS

  dimension: assign_flg {
    type: string
    sql: _bm_active_bugs_detail_data.assign_flg ;;
    view_label: "Bug Management SLO"
    hidden: no
  }
  dimension: assignee {
    type: string
    sql: _bm_active_bugs_detail_data.assignee ;;
    view_label: "Bug Management SLO"
    hidden: no
  }
  dimension: assignment_slo {
    type: string
    sql: _bm_active_bugs_detail_data.assignment_slo ;;
    view_label: "Bug Management SLO"
    hidden: no
  }
  dimension: bug_id {
    type: string
    sql: _bm_active_bugs_detail_data.bug_id ;;
    view_label: "Bug Management SLO"
    hidden: no
  }
  dimension: bug_status {
    type: string
    sql: _bm_active_bugs_detail_data.bug_status ;;
    view_label: "Bug Management SLO"
    hidden: no
  }
  dimension: bug_type {
    type: string
    sql: _bm_active_bugs_detail_data.bug_type ;;
    view_label: "Bug Management SLO"
    hidden: no
  }
  dimension: closure_slo {
    type: string
    sql: _bm_active_bugs_detail_data.closure_slo ;;
    view_label: "Bug Management SLO"
    hidden: no
  }
  dimension_group: creation {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: _bm_active_bugs_detail_data.creation_date ;;
    view_label: "Bug Management SLO"
    hidden: no
  }
  dimension_group: last_modified {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: _bm_active_bugs_detail_data.last_modified_date ;;
    view_label: "Bug Management SLO"
    hidden: no
  }
  dimension: latest_component_path {
    type: string
    sql: _bm_active_bugs_detail_data.latest_component_path ;;
    view_label: "Bug Management SLO"
    hidden: no
  }
  dimension: manager_name {
    type: string
    sql: _bm_active_bugs_detail_data.manager_name ;;
    view_label: "Bug Management SLO"
    hidden: no
  }
  dimension: priority {
    type: string
    sql: _bm_active_bugs_detail_data.priority ;;
    view_label: "Bug Management SLO"
    hidden: no
  }
  dimension: response_slo {
    type: string
    sql: _bm_active_bugs_detail_data.response_slo ;;
    view_label: "Bug Management SLO"
    hidden: no
  }
  dimension: slo_flg {
    type: string
    sql: _bm_active_bugs_detail_data.slo_flg ;;
    view_label: "Bug Management SLO"
    hidden: no
  }
  dimension: slo_status {
    type: string
    sql: _bm_active_bugs_detail_data.slo_status ;;
    view_label: "Bug Management SLO"
    hidden: no
  }
  dimension: status {
    type: string
    sql: _bm_active_bugs_detail_data.status ;;
    view_label: "Bug Management SLO"
    hidden: no
  }
  dimension: title {
    type: string
    sql: _bm_active_bugs_detail_data.title ;;
    view_label: "Bug Management SLO"
    hidden: no
  }
  dimension: total {
    type: number
    sql: _bm_active_bugs_detail_data.total ;;
    view_label: "Bug Management SLO"
    hidden: no
  }
}
