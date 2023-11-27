include: "/views/refinements/*.view.lkml"

view: +three_pdc_metrics_demo{

  dimension: bct_detail_summary_data {
    hidden: yes
    sql: ${TABLE}.bct_detail_summary_data ;;
  }
  dimension: bct_met_count {
    type: number
    sql: ${TABLE}.bct_met_count ;;
    hidden: yes
    view_label: "Bug Cycle Time"
  }
  dimension: bct_miss_count {
    type: number
    sql: ${TABLE}.bct_miss_count ;;
    hidden: yes
    view_label: "Bug Cycle Time"
  }
  dimension: bct_total_count {
    type: number
    sql: ${TABLE}.bct_total_count ;;
    hidden: yes
    view_label: "Bug Cycle Time"
  }
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
    hidden: no
    value_format: "0.00\%"
    view_label: "Bug Cycle Time"
    label: "Builds Cycle Time (Target: 95%)"
  }
}

view: _bct_detail_summary_data {

  dimension: bct_met_count {
    type: number
    sql: ${TABLE}.bct_met_count ;;
    hidden: no
  }
  dimension: bct_miss_count {
    type: number
    sql: ${TABLE}.bct_miss_count ;;
    hidden: no
  }
  dimension: bct_total_count {
    type: number
    sql: ${TABLE}.bct_total_count ;;
    hidden: no
  }
  dimension: build_type {
    type: string
    sql: build_type ;;
    hidden: no
  }
  dimension: comment {
    type: string
    sql: comment ;;
    hidden: no
  }
  dimension: is_marine_or_payload {
    type: yesno
    sql: is_marine_or_payload ;;
    hidden: no
  }
  dimension: marine_payload_flag {
    type: string
    sql: marine_payload_flag ;;
    hidden: no
  }
  dimension: phase_id {
    type: string
    sql: phase_id ;;
    hidden: no
  }
  dimension: phase_owner {
    type: string
    sql: phase_owner ;;
    hidden: no
  }
  dimension: process_model {
    type: string
    sql: process_model ;;
    hidden: no
  }
  dimension: root_cause_owner {
    type: string
    sql: root_cause_owner ;;
    hidden: no
  }
  dimension: slip_code_tier_1 {
    type: string
    sql: slip_code_tier_1 ;;
    hidden: no
  }
  dimension: slip_code_tier_2 {
    type: string
    sql: slip_code_tier_2 ;;
    hidden: no
  }
  dimension: slo_slip_type {
    type: string
    sql: slo_slip_type ;;
    hidden: no
  }
  dimension_group: slo_target {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: slo_target_date ;;
    hidden: no
  }
  dimension: viewpoint_link {
    type: string
    sql: viewpoint_link ;;
    hidden: no
  }
}
