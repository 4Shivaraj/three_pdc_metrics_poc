include: "/views/refinements/*.view.lkml"

view: +three_pdc_metrics_demo{

  dimension: bm_active_bugs_detail_data {
    hidden: yes
    sql: ${TABLE}.bm_active_bugs_detail_data ;;
  }
  dimension: bm_closed_cnt {
    type: number
    sql: ${TABLE}.bm_closed_cnt ;;
    hidden: no
  }
  dimension: bm_escalated_cnt {
    type: number
    sql: ${TABLE}.bm_escalated_cnt ;;
    hidden: no
  }
}


view: _bm_active_bugs_detail_data {

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
