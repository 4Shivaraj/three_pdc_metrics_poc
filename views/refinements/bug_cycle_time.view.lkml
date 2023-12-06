########################################################################################################
# Update Log:
#   29/11/2023 — Builds Cycle Time
########################################################################################################

########################################################################################################
# Description:
#   Purpose of this table is to include all the details of Builds Cycle Time
########################################################################################################


include: "/views/refinements/*.view.lkml"

view: +three_pdc_metrics_demo{

##### DIMENSIONS

  dimension: bct_detail_summary_data {
    sql: ${TABLE}.bct_detail_summary_data ;;
    view_label: "Builds Cycle Time"
    hidden: yes
  }
  dimension: bct_met_count {
    type: number
    sql: ${TABLE}.bct_met_count ;;
    view_label: "Builds Cycle Time"
    hidden: yes
  }
  dimension: bct_miss_count {
    type: number
    sql: ${TABLE}.bct_miss_count ;;
    view_label: "Builds Cycle Time"
    hidden: yes
  }
  dimension: bct_total_count {
    type: number
    sql: ${TABLE}.bct_total_count ;;
    view_label: "Builds Cycle Time"
    hidden: yes
  }

##### MEASURES

  measure: bct_slo_score {
    type: number
    sql: ROUND(SAFE_DIVIDE(SUM(${bct_met_count}), SUM(${bct_total_count}))*100, 2) ;;
    html:
    {% if value >= 95 %}
    <p style="color: black; background-color: #4285f4;">{{ value }}%</p>
    {% elsif value < 95 %}
    <p style="color: black; background-color: #fbc02d;">{{ value }}%</p>
    {% elsif value < 90 %}
    <p style="color: black; background-color: #db4437;">{{ value }}%</p>
    {% endif %}
    ;;
    link: {
      label: "3PDC Builds Cycle Time"
      url: "https://69af6669-814a-475b-8caf-6e43a13b16e2.looker.app/dashboards/28?&Region={{ _filters['three_pdc_metrics_demo.region']| url_encode }}&Metro={{ _filters['three_pdc_metrics_demo.metro']| url_encode }}"
    }
    value_format: "0.00\%"
    label: "Builds Cycle Time (Target: 95%)"
    view_label: "Builds Cycle Time"
    hidden: no
  }
  measure: bct_target {
    type: number
    sql: 0.95 * 100 ;;
    value_format: "0.00\%"
    view_label: "Builds Cycle Time"
    hidden: no
  }
}

view: _bct_detail_summary_data {

##### DIMENSIONS

  dimension: bct_met_count {
    type: number
    sql: ${TABLE}.bct_met_count ;;
    view_label: "Builds Cycle Time"
    hidden: no
  }
  dimension: bct_miss_count {
    type: number
    sql: ${TABLE}.bct_miss_count ;;
    view_label: "Builds Cycle Time"
    hidden: no
  }
  dimension: bct_total_count {
    type: number
    sql: ${TABLE}.bct_total_count ;;
    view_label: "Builds Cycle Time"
    hidden: no
  }
  dimension: build_type {
    type: string
    sql: build_type ;;
    view_label: "Builds Cycle Time"
    hidden: no
  }
  dimension: comment {
    type: string
    sql: comment ;;
    view_label: "Builds Cycle Time"
    hidden: no
  }
  dimension: is_marine_or_payload {
    type: yesno
    sql: is_marine_or_payload ;;
    view_label: "Builds Cycle Time"
    hidden: no
  }
  dimension: marine_payload_flag {
    type: string
    sql: marine_payload_flag ;;
    view_label: "Builds Cycle Time"
    hidden: no
  }
  dimension: phase_id {
    type: string
    sql: phase_id ;;
    view_label: "Builds Cycle Time"
    hidden: no
  }
  dimension: phase_owner {
    type: string
    sql: phase_owner ;;
    view_label: "Builds Cycle Time"
    hidden: no
  }
  dimension: process_model {
    type: string
    sql: process_model ;;
    view_label: "Builds Cycle Time"
    hidden: no
  }
  dimension: root_cause_owner {
    type: string
    sql: root_cause_owner ;;
    view_label: "Builds Cycle Time"
    hidden: no
  }
  dimension: slip_code_tier_1 {
    type: string
    sql: slip_code_tier_1 ;;
    view_label: "Builds Cycle Time"
    hidden: no
  }
  dimension: slip_code_tier_2 {
    type: string
    sql: slip_code_tier_2 ;;
    view_label: "Builds Cycle Time"
    hidden: no
  }
  dimension: slo_slip_type {
    type: string
    sql: slo_slip_type ;;
    view_label: "Builds Cycle Time"
    hidden: no
  }
  dimension_group: slo_target {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: slo_target_date ;;
    view_label: "Builds Cycle Time"
    hidden: no
  }
  dimension: viewpoint_link {
    type: string
    sql: viewpoint_link ;;
    view_label: "Builds Cycle Time"
    hidden: no
  }
}
