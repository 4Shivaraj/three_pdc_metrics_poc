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
      label: "3PDC Data Security RCA"
      url: "https://69af6669-814a-475b-8caf-6e43a13b16e2.looker.app/dashboards/23?&Region={{ _filters['three_pdc_metrics_demo.region']| url_encode }}&Metro={{ _filters['three_pdc_metrics_demo.metro']| url_encode }}"
    }
    value_format: "0.00\%"
    label: "Data Security RCA (Target: 100%)"
    view_label: "Data Security RCA"
    hidden: no
  }
  measure: om_verified_score {
    type: number
    sql: SAFE_DIVIDE(SUM(${ds_rca_om_verified_met_sli_sum}), SUM(${ds_rca_om_verified_met_sli_count})) ;;
    value_format_name: percent_0
    view_label: "Data Security RCA"
    hidden: no
  }
  measure: ds_rca_target {
    type: number
    sql: 1 ;;
    value_format_name: percent_0
    view_label: "Data Security RCA"
    hidden: no
  }
}
view: _ds_rca_detail_data {

##### DIMENSIONS

  dimension: bug_id {
    type: number
    sql: bug_id ;;
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
