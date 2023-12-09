########################################################################################################
# Update Log:
#   29/11/2023 — Data Security RCA
########################################################################################################

########################################################################################################
# Description:
#   Purpose of this table is to include all the details of Data Security RCA
########################################################################################################

include: "/views/refinements/*.view.lkml"

view: +three_pdc_metrics_demo{

##### DIMENSIONS

  dimension: ds_rca_detail_data {
    sql: ${TABLE}.ds_rca_detail_data ;;
    view_label: "Data Security RCA"
    hidden: yes
  }
  dimension: ds_rca_om_verified_met_sli_count {
    type: number
    sql: ${TABLE}.ds_rca_om_verified_met_sli_count ;;
    view_label: "Data Security RCA"
    hidden: no
  }
  dimension: ds_rca_om_verified_met_sli_sum {
    type: number
    sql: ${TABLE}.ds_rca_om_verified_met_sli_sum ;;
    view_label: "Data Security RCA"
    hidden: no
  }
  dimension: ds_rca_root_cause_met_sli_count {
    type: number
    sql: ${TABLE}.ds_rca_root_cause_met_sli_count ;;
    view_label: "Data Security RCA"
    hidden: yes
  }
  dimension: ds_rca_root_cause_met_sli_sum {
    type: number
    sql: ${TABLE}.ds_rca_root_cause_met_sli_sum ;;
    view_label: "Data Security RCA"
    hidden: yes
  }

##### MEASURES

  measure: ds_rca_slo_score {
    type: number
    sql:  ROUND((SAFE_DIVIDE(SUM(${ds_rca_root_cause_met_sli_sum}), SUM(${ds_rca_root_cause_met_sli_count})))*100,2);;
    html:
    {% if value == 100 %}
    <p style="color: black; background-color: #4285f4;">{{ value }}%</p>
    {% elsif value < 100 %}
    <p style="color: black; background-color: #fbc02d;">{{ value }}%</p>
    {% elsif value < 95 %}
    <p style="color: black; background-color: #db4437;">{{ value }}%</p>
    {% endif %}
    ;;
    link: {
      # label: "SLO Score"
      label: "3PDC Data Security RCA"
      url: "https://68d5f542-af0a-42c3-b66e-7d93874cb867.looker.app/dashboards/9?Region={{ _filters['three_pdc_metrics_demo.region']| url_encode }}&Metro={{ _filters['three_pdc_metrics_demo.metro']| url_encode }}&Duration%20Type={{ _filters['three_pdc_metrics_demo.param_duration_type']| url_encode }}&Duration%20Date={{ _filters['three_pdc_metrics_demo.p_duration_date']| url_encode }}"
      }
    value_format: "0.00\%"
    label: "Data Security RCA (Target: 100%)"
    view_label: "Data Security RCA"
    hidden: no
  }
  measure: om_verified_score {
    type: number
    sql: ROUND(SAFE_DIVIDE(SUM(${ds_rca_om_verified_met_sli_sum}), SUM(${ds_rca_om_verified_met_sli_count}))*100,2) ;;
    value_format: "0.00\%"
    view_label: "Data Security RCA"
    hidden: no
  }
  measure: ds_rca_target {
    type: number
    sql: 1 * 100 ;;
    value_format: "0.00\%"
    label: "Target"
    view_label: "Data Security RCA"
    hidden: no
  }
}
view: _ds_rca_detail_data {

##### DIMENSIONS

  dimension: bug_id {
    type: number
    sql: bug_id ;;
    value_format_name: id
    view_label: "Data Security RCA"
    hidden: no
  }
  dimension: campus {
    type: string
    sql: campus ;;
    view_label: "Data Security RCA"
    hidden: no
  }
  dimension: location_type {
    type: string
    sql: location_type ;;
    view_label: "Data Security RCA"
    hidden: no
  }
  dimension: rca_duration_days {
    type: number
    sql: rca_duration_days ;;
    view_label: "Data Security RCA"
    hidden: no
  }
  dimension: slip_root_cause {
    type: string
    sql: slip_root_cause ;;
    view_label: "Data Security RCA"
    hidden: no
  }
  dimension: verified_by_om_days {
    type: number
    sql: verified_by_om_days ;;
    view_label: "Data Security RCA"
    hidden: no
  }
  dimension: violation_type {
    type: string
    sql: violation_type ;;
    view_label: "Data Security RCA"
    hidden: no
  }
}
