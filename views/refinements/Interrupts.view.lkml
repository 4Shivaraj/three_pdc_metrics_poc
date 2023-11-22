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
    hidden: yes
    view_label: "Interrupts Summary"
  }
  dimension: irpt_total_bugs {
    type: number
    sql: ${TABLE}.irpt_total_bugs ;;
    hidden: yes
    view_label: "Interrupts Summary"
  }
  measure: irpt_slo_score {
    type: number
    sql: ROUND(SAFE_DIVIDE(SUM(${irpt_slo_met}), SUM(${irpt_total_bugs}))*100,2) ;;
    html:
    {% if value >= 85 %}
    <p style="color: black; background-color: #4285f4;">{{ value }}</p>
    {% elsif value < 85 %}
    <p style="color: black; background-color: #fbc02d;">{{ value }}</p>
    {% elsif value < 80 %}
    <p style="color: black; background-color: #db4437;">{{ value }}</p>
    {% endif %}
    ;;
    hidden: no
    value_format: "0.00\%"
    view_label: "Interrupts Summary"
    label: "Interrupts SLO Score (Target: 85%)"
  }
}

view: _irpt_active_bugs_detail_data {
  dimension: assign_flg {
    type: string
    sql: assign_flg ;;
    hidden: no
  }
  dimension: assignee {
    type: string
    sql: assignee ;;
    hidden: no
  }
  dimension: assignment_slo {
    type: string
    sql: assignment_slo ;;
    hidden: no
  }
  dimension: bug_id {
    type: string
    sql: bug_id ;;
    hidden: no
  }
  dimension: bug_status {
    type: string
    sql: bug_status ;;
    hidden: no
  }
  dimension: bug_type {
    type: string
    sql: bug_type ;;
    hidden: no
  }
  dimension: closure_slo {
    type: string
    sql: closure_slo ;;
    hidden: no
  }
  dimension_group: creation {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: creation_date ;;
    hidden: no
  }
  dimension_group: last_modified {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: last_modified_date ;;
    hidden: no
  }
  dimension: latest_component_path {
    type: string
    sql: latest_component_path ;;
    hidden: no
  }
  dimension: manager_name {
    type: string
    sql: manager_name ;;
    hidden: no
  }
  dimension: priority {
    type: string
    sql: priority ;;
    hidden: no
  }
  dimension: response_slo {
    type: string
    sql: response_slo ;;
    hidden: no
  }
  dimension: slo_flg {
    type: string
    sql: slo_flg ;;
    hidden: no
  }
  dimension: slo_status {
    type: string
    sql: slo_status ;;
    hidden: no
  }
  dimension: status {
    type: string
    sql: status ;;
    hidden: no
  }
  dimension: title {
    type: string
    sql: title ;;
    hidden: no
  }
  dimension: total {
    type: number
    sql: total ;;
    hidden: no
  }
}

view: _irpt_summary_data {

  dimension: bug_id {
    type: number
    sql: bug_id ;;
    hidden: no
  }
  dimension: slo_all_met {
    type: number
    sql: slo_all_met ;;
    hidden: no
  }
}
