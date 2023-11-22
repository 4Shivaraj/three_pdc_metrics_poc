include: "/views/refinements/*.view.lkml"

view: +three_pdc_metrics_demo{

  dimension: ds_rca_detail_data {
    hidden: yes
    sql: ${TABLE}.ds_rca_detail_data ;;
  }
  dimension: ds_rca_om_verified_met_sli_count {
    type: number
    sql: ${TABLE}.ds_rca_om_verified_met_sli_count ;;
    hidden: no
  }
  dimension: ds_rca_om_verified_met_sli_sum {
    type: number
    sql: ${TABLE}.ds_rca_om_verified_met_sli_sum ;;
    hidden: no
  }
  dimension: ds_rca_root_cause_met_sli_count {
    type: number
    sql: ${TABLE}.ds_rca_root_cause_met_sli_count ;;
    hidden: no
  }
  dimension: ds_rca_root_cause_met_sli_sum {
    type: number
    sql: ${TABLE}.ds_rca_root_cause_met_sli_sum ;;
    hidden: no
  }
}
view: _ds_rca_detail_data {

  dimension: bug_id {
    type: number
    sql: bug_id ;;
    hidden: no
  }
  dimension: campus {
    type: string
    sql: campus ;;
    hidden: no
  }
  dimension: location_type {
    type: string
    sql: location_type ;;
    hidden: no
  }
  dimension: rca_duration_days {
    type: number
    sql: rca_duration_days ;;
    hidden: no
  }
  dimension: slip_root_cause {
    type: string
    sql: slip_root_cause ;;
    hidden: no
  }
  dimension: verified_by_om_days {
    type: number
    sql: verified_by_om_days ;;
    hidden: no
  }
  dimension: violation_type {
    type: string
    sql: violation_type ;;
    hidden: no
  }
}
