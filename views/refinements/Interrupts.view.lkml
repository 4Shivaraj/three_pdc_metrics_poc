########################################################################################################
# Update Log:
#   29/11/2023 — Interrupts
########################################################################################################

########################################################################################################
# Description:
#   Purpose of this table is to include all the details of Interrupts
########################################################################################################

include: "/views/refinements/*.view.lkml"

view: +three_pdc_metrics_demo{

##### DIMENSIONS

  dimension: irpt_active_bugs_detail_data {
    sql: ${TABLE}.irpt_active_bugs_detail_data ;;
    view_label: "Interrupts Active Bugs"
    hidden: yes
  }
  dimension: irpt_summary_data {
    sql: ${TABLE}.irpt_summary_data ;;
    view_label: "Interrupts Active Bugs"
    hidden: yes
  }
  dimension: irpt_slo_met {
    type: number
    sql: ${TABLE}.irpt_slo_met ;;
    view_label: "Interrupts Active Bugs"
    hidden: no
  }
  dimension: irpt_total_bugs {
    type: number
    sql: ${TABLE}.irpt_total_bugs ;;
    view_label: "Interrupts Active Bugs"
    hidden: no
  }

##### MEASURES

  measure: irpt_slo_score {
    type: number
    sql: ROUND(SAFE_DIVIDE(SUM(${irpt_slo_met}), SUM(${irpt_total_bugs}))*100,2) ;;
    html:
    {% if value >= 85 %}
    <p style="color: black; background-color: #4285f4;">{{ value }}%</p>
    {% elsif value < 85 %}
    <p style="color: black; background-color: #fbc02d;">{{ value }}%</p>
    {% elsif value < 80 %}
    <p style="color: black; background-color: #db4437;">{{ value }}%</p>
    {% endif %}
    ;;
    link: {
      label: "3PDC Interrupts SLO"
      url: "https://69af6669-814a-475b-8caf-6e43a13b16e2.looker.app/dashboards/27?&Region={{ _filters['three_pdc_metrics_demo.region']| url_encode }}&Metro={{ _filters['three_pdc_metrics_demo.metro']| url_encode }}"
    }
    value_format: "0.00\%"
    label: "Interrupts SLO Score (Target: 85%)"
    view_label: "Interrupts Active Bugs"
    hidden: no
  }
  measure: target {
    type: number
    sql: 0.85 * 100 ;;
    value_format: "0.00\%"
    view_label: "Interrupts Active Bugs"
    hidden: no
  }
}

view: _irpt_active_bugs_detail_data {

##### DIMENSIONS

  dimension: assign_flg {
    type: string
    sql: _irpt_active_bugs_detail_data.assign_flg ;;
    view_label: "Interrupts Active Bugs"
    hidden: no
  }
  dimension: assignee {
    type: string
    sql: _irpt_active_bugs_detail_data.assignee ;;
    view_label: "Interrupts Active Bugs"
    hidden: no
  }
  dimension: assignment_slo {
    type: string
    sql: _irpt_active_bugs_detail_data.assignment_slo ;;
    view_label: "Interrupts Active Bugs"
    hidden: no
  }
  dimension: bug_id {
    type: string
    sql: _irpt_active_bugs_detail_data.bug_id ;;
    view_label: "Interrupts Active Bugs"
    hidden: no
  }
  dimension: bug_status {
    type: string
    sql: _irpt_active_bugs_detail_data.bug_status ;;
    view_label: "Interrupts Active Bugs"
    hidden: no
  }
  dimension: bug_type {
    type: string
    sql: _irpt_active_bugs_detail_data.bug_type ;;
    view_label: "Interrupts Active Bugs"
    hidden: no
  }
  dimension: closure_slo {
    type: string
    sql: _irpt_active_bugs_detail_data.closure_slo ;;
    view_label: "Interrupts Active Bugs"
    hidden: no
  }
  dimension_group: creation {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: _irpt_active_bugs_detail_data.creation_date ;;
    view_label: "Interrupts Active Bugs"
    hidden: no
  }
  dimension_group: last_modified {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: _irpt_active_bugs_detail_data.last_modified_date ;;
    view_label: "Interrupts Active Bugs"
    hidden: no
  }
  dimension: latest_component_path {
    type: string
    sql: _irpt_active_bugs_detail_data.latest_component_path ;;
    view_label: "Interrupts Active Bugs"
    hidden: no
  }
  dimension: manager_name {
    type: string
    sql: _irpt_active_bugs_detail_data.manager_name ;;
    view_label: "Interrupts Active Bugs"
    hidden: no
  }
  dimension: priority {
    type: string
    sql: _irpt_active_bugs_detail_data.priority ;;
    view_label: "Interrupts Active Bugs"
    hidden: no
  }
  dimension: response_slo {
    type: string
    sql: _irpt_active_bugs_detail_data.response_slo ;;
    view_label: "Interrupts Active Bugs"
    hidden: no
  }
  dimension: slo_flg {
    type: string
    sql: _irpt_active_bugs_detail_data.slo_flg ;;
    view_label: "Interrupts Active Bugs"
    hidden: no
  }
  dimension: slo_status {
    type: string
    sql: _irpt_active_bugs_detail_data.slo_status ;;
    view_label: "Interrupts Active Bugs"
    hidden: no
  }
  dimension: status {
    type: string
    sql: _irpt_active_bugs_detail_data.status ;;
    view_label: "Interrupts Active Bugs"
    hidden: no
  }
  dimension: title {
    type: string
    sql: _irpt_active_bugs_detail_data.title ;;
    view_label: "Interrupts Active Bugs"
    hidden: no
  }
  dimension: total {
    type: number
    sql: _irpt_active_bugs_detail_data.total ;;
    view_label: "Interrupts Active Bugs"
    hidden: no
  }
}

view: _irpt_summary_data {

##### DIMENSIONS

  dimension: bug_id {
    type: number
    sql: _irpt_active_bugs_detail_data.bug_id ;;
    view_label: "Interrupts Active Bugs Summary"
    hidden: no
  }
  dimension: slo_all_met {
    type: number
    sql: _irpt_summary_data.slo_all_met ;;
    view_label: "Interrupts Active Bugs Summary"
    hidden: no
  }
}
