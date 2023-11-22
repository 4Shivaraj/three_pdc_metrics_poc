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
    view_label: "Data Security RCA"
  }
  dimension: ds_rca_om_verified_met_sli_sum {
    type: number
    sql: ${TABLE}.ds_rca_om_verified_met_sli_sum ;;
    hidden: no
    view_label: "Data Security RCA"
  }
  dimension: ds_rca_root_cause_met_sli_count {
    type: number
    sql: ${TABLE}.ds_rca_root_cause_met_sli_count ;;
    hidden: yes
    view_label: "Data Security RCA"
  }
  dimension: ds_rca_root_cause_met_sli_sum {
    type: number
    sql: ${TABLE}.ds_rca_root_cause_met_sli_sum ;;
    hidden: yes
    view_label: "Data Security RCA"
  }
  measure: ds_rca_slo_score {
    type: number
    sql:  ROUND((SAFE_DIVIDE(SUM(${ds_rca_root_cause_met_sli_sum}), SUM(${ds_rca_root_cause_met_sli_count})))*100,2);;

    html:
    {% if value == 100 %}
    <p style="color: black; background-color: #4285f4;">{{ value }}</p>
    {% elsif value < 100 %}
    <p style="color: black; background-color: #fbc02d;">{{ value }}</p>
    {% elsif value < 95 %}
    <p style="color: black; background-color: #db4437;">{{ value }}</p>
    {% endif %}
    ;;
    hidden: no
    value_format: "0.00\%"
    view_label: "Data Security RCA"
    label: "Data Security RCA (Target: 100%)"
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
