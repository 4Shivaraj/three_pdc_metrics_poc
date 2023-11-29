include: "/views/refinements/*.view.lkml"

view: +three_pdc_metrics_demo{

  dimension: irpt_active_bugs_detail_data {
    hidden: yes
    sql: ${TABLE}.irpt_active_bugs_detail_data ;;
  }
  dimension: irpt_summary_data {
    hidden: yes
    sql: ${TABLE}.irpt_summary_data ;;
  }
  dimension: irpt_slo_met {
    type: number
    sql: ${TABLE}.irpt_slo_met ;;
    hidden: no
    view_label: "Interrupts Summary"
  }
  dimension: irpt_total_bugs {
    type: number
    sql: ${TABLE}.irpt_total_bugs ;;
    hidden: no
    view_label: "Interrupts Summary"
  }
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
    hidden: no
    value_format: "0.00\%"
    view_label: "Interrupts Summary"
    label: "Interrupts SLO Score (Target: 85%)"
  }
  measure: target {
    type: number
    sql: 0.85 * 100 ;;
    value_format: "0.00\%"
    hidden: no
    view_label: "Interrupts Summary"
  }
}

view: _irpt_active_bugs_detail_data {
  dimension: assign_flg {
    type: string
    sql: _irpt_active_bugs_detail_data.assign_flg ;;
    hidden: no
  }
  dimension: assignee {
    type: string
    sql: _irpt_active_bugs_detail_data.assignee ;;
    hidden: no
  }
  dimension: assignment_slo {
    type: string
    sql: _irpt_active_bugs_detail_data.assignment_slo ;;
    hidden: no
  }
  dimension: bug_id {
    type: string
    sql: _irpt_active_bugs_detail_data.bug_id ;;
    hidden: no
  }
  dimension: bug_status {
    type: string
    sql: _irpt_active_bugs_detail_data.bug_status ;;
    hidden: no
  }
  dimension: bug_type {
    type: string
    sql: _irpt_active_bugs_detail_data.bug_type ;;
    hidden: no
  }
  dimension: closure_slo {
    type: string
    sql: _irpt_active_bugs_detail_data.closure_slo ;;
    hidden: no
  }
  dimension_group: creation {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: _irpt_active_bugs_detail_data.creation_date ;;
    hidden: no
  }
  dimension_group: last_modified {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: _irpt_active_bugs_detail_data.last_modified_date ;;
    hidden: no
  }
  dimension: latest_component_path {
    type: string
    sql: _irpt_active_bugs_detail_data.latest_component_path ;;
    hidden: no
  }
  dimension: manager_name {
    type: string
    sql: _irpt_active_bugs_detail_data.manager_name ;;
    hidden: no
  }
  dimension: priority {
    type: string
    sql: _irpt_active_bugs_detail_data.priority ;;
    hidden: no
  }
  dimension: response_slo {
    type: string
    sql: _irpt_active_bugs_detail_data.response_slo ;;
    hidden: no
  }
  dimension: slo_flg {
    type: string
    sql: _irpt_active_bugs_detail_data.slo_flg ;;
    hidden: no
  }
  dimension: slo_status {
    type: string
    sql: _irpt_active_bugs_detail_data.slo_status ;;
    hidden: no
  }
  dimension: status {
    type: string
    sql: _irpt_active_bugs_detail_data.status ;;
    hidden: no
  }
  dimension: title {
    type: string
    sql: _irpt_active_bugs_detail_data.title ;;
    hidden: no
  }
  dimension: total {
    type: number
    sql: _irpt_active_bugs_detail_data.total ;;
    hidden: no
  }
}

view: _irpt_summary_data {

  dimension: bug_id {
    type: number
    sql: _irpt_active_bugs_detail_data.bug_id ;;
    hidden: no
  }
  dimension: slo_all_met {
    type: number
    sql: _irpt_summary_data.slo_all_met ;;
    hidden: no
  }
}
