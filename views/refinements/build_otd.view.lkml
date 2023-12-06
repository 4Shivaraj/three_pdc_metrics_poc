########################################################################################################
# Update Log:
#   29/11/2023 — Build OTD
########################################################################################################

########################################################################################################
# Description:
#   Purpose of this table is to include all the details of Build OTD
########################################################################################################

include: "/views/refinements/*.view.lkml"

view: +three_pdc_metrics_demo{

##### DIMENSIONS

  dimension: botd_detail_summary_data {
    sql: ${TABLE}.botd_detail_summary_data ;;
    view_label: "Build OTD"
    hidden: yes
  }
  dimension: botd_met_count {
    type: number
    sql: ${TABLE}.botd_met_count ;;
    view_label: "Build OTD"
    hidden: yes
  }
  dimension: botd_miss_count {
    type: number
    sql: ${TABLE}.botd_miss_count ;;
    view_label: "Build OTD"
    hidden: no
  }
  dimension: botd_total_count {
    type: number
    sql: ${TABLE}.botd_total_count ;;
    view_label: "Build OTD"
    hidden: yes
  }
  dimension: builds_otd_numerator {
    type: number
    sql: ${botd_met_count} ;;
    view_label: "Build OTD"
    hidden: no
  }
  dimension: builds_otd_denominator {
    type: number
    sql: ${botd_total_count};;
    view_label: "Build OTD"
    hidden: no
  }

##### MEASURES

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
    link: {
      label: "3PDC Build OTD"
      url: "https://69af6669-814a-475b-8caf-6e43a13b16e2.looker.app/dashboards/22?&Region={{ _filters['three_pdc_metrics_demo.region']| url_encode }}&Metro={{ _filters['three_pdc_metrics_demo.metro']| url_encode }}"
    }
    value_format: "0.00\%"
    label: "Build OTD (Target: 90%)"
    view_label: "Build OTD"
    hidden: no
  }
  measure: build_otd_target {
    type: number
    sql: 0.99 * 100 ;;
    value_format: "0.00\%"
    view_label: "Build OTD"
    hidden: no
  }
}


view: _botd_detail_summary_data {

  dimension: build_type {
    type: string
    sql: _botd_detail_summary_data.build_type ;;
    view_label: "Build OTD"
    hidden: no
  }
  dimension: builds_otd_denominator {
    type: number
    sql: _botd_detail_summary_data.builds_otd_denominator ;;
    view_label: "Build OTD"
    hidden: no
  }
  dimension: builds_otd_numerator {
    type: number
    sql: _botd_detail_summary_data.builds_otd_numerator ;;
    view_label: "Build OTD"
    hidden: no
  }
  dimension_group: completion {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: _botd_detail_summary_data.completion_date ;;
    view_label: "Build OTD"
    hidden: no
  }
  dimension: miss_count {
    type: number
    sql: _botd_detail_summary_data.miss_count ;;
    view_label: "Build OTD"
    hidden: no
  }
  dimension: rack_type {
    type: string
    sql: _botd_detail_summary_data.rack_type ;;
    view_label: "Build OTD"
    hidden: no
  }
  dimension: slip_reason {
    type: string
    sql: _botd_detail_summary_data.slip_reason ;;
    view_label: "Build OTD"
    hidden: no
  }
  dimension: slip_reason_category {
    type: string
    sql: _botd_detail_summary_data.slip_reason_category ;;
    view_label: "Build OTD"
    hidden: no
  }
  dimension_group: slo_target {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: _botd_detail_summary_data.slo_target_date ;;
    view_label: "Build OTD"
    hidden: no
  }
  dimension: viewpoint_link {
    type: string
    sql: _botd_detail_summary_data.viewpoint_link ;;
    view_label: "Build OTD"
    hidden: no
  }

##### MEASURES

  measure: slip_reason_count {
    type: number
    sql: count(${slip_reason}) ;;
    view_label: "Build OTD"
    hidden: no
  }
}
