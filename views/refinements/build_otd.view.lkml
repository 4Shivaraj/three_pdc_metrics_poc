include: "/views/refinements/*.view.lkml"

view: +three_pdc_metrics_demo{

  dimension: botd_detail_summary_data {
    hidden: yes
    sql: ${TABLE}.botd_detail_summary_data ;;
  }
  dimension: botd_met_count {
    type: number
    sql: ${TABLE}.botd_met_count ;;
    hidden: yes
    view_label: "Build OTD"
  }
  dimension: botd_miss_count {
    type: number
    sql: ${TABLE}.botd_miss_count ;;
    hidden: no
    view_label: "Build OTD"
  }
  dimension: botd_total_count {
    type: number
    sql: ${TABLE}.botd_total_count ;;
    hidden: yes
    view_label: "Build OTD"
  }
  dimension: builds_otd_numerator {
    type: number
    sql: ${botd_met_count} ;;
    hidden: no
    view_label: "Build OTD"
  }
  dimension: builds_otd_denominator {
    type: number
    sql: ${botd_total_count};;
    hidden: no
    view_label: "Build OTD"
  }
  measure: botd_slo_score {
    type: number
    sql: ROUND((SUM(${builds_otd_numerator}) / SUM(${builds_otd_denominator})) * 100, 2)   ;;
    html:
    {% if value >= 90 %}
    <p style="color: black; background-color: #4285f4;">{{ value }}%</p>
    {% elsif value < 90 %}
    <p style="color: black; background-color: #fbc02d;">{{ value }}%</p>
    {% elsif value < 85 %}
    <p style="color: black; background-color: #db4437;">{{ value }}%</p>
    {% endif %}
    ;;
    value_format: "0.00\%"
    hidden: no
    view_label: "Build OTD"
    label: "Build OTD (Target: 90%)"

  }
}

view: _botd_detail_summary_data {

  dimension: build_type {
    type: string
    sql: build_type ;;
    hidden: no
  }
  dimension: builds_otd_denominator {
    type: number
    sql: builds_otd_denominator ;;
    hidden: no
  }
  dimension: builds_otd_numerator {
    type: number
    sql: builds_otd_numerator ;;
    hidden: no
  }
  dimension_group: completion {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: completion_date ;;
    hidden: no
  }
  dimension: miss_count {
    type: number
    sql: miss_count ;;
    hidden: no
  }
  dimension: rack_type {
    type: string
    sql: rack_type ;;
    hidden: no
  }
  dimension: slip_reason {
    type: string
    sql: slip_reason ;;
    hidden: no
  }
  dimension: slip_reason_category {
    type: string
    sql: slip_reason_category ;;
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
