include: "/views/raw/*.view.lkml"
include: "/views/derived/*.view.lkml"

view: +three_pdc_metrics_demo {

  dimension_group: calendar {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.calendar_date ;;
    hidden: no
  }

  dimension_group: week_start {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.week_start_date ;;
    hidden: no
  }
  dimension_group: month_start {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.month_start_date ;;
    hidden: no
  }
  dimension_group: quarter_start {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.quarter_start_date ;;
    hidden: no
  }
  dimension_group: year_start {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.year_start_date ;;
    hidden: no
  }

  parameter: param_duration_type {
    type: string
    allowed_value: {
      label: "Year"
      value: "Year"
    }
    allowed_value: {
      label: "Quarter"
      value: "Quarter"
    }
    allowed_value: {
      label: "Month"
      value: "Month"
    }
    allowed_value: {
      label: "Week"
      value: "Week"
    }
  }
  dimension: p_duration_date {
    type: string
    sql: CASE
            WHEN {% parameter param_duration_type %} = 'Year' THEN CAST(${year_start_date} AS STRING)
            WHEN {% parameter param_duration_type %} = 'Quarter' THEN CAST(${quarter_start_date} AS STRING)
            WHEN {% parameter param_duration_type %} = 'Month' THEN CAST(${month_start_date} AS STRING)
            WHEN {% parameter param_duration_type %} = 'Week' THEN CAST(${week_start_date} AS STRING)
            ELSE CAST(${TABLE}.year_start_date AS STRING)
          END;;
    hidden: no
  }
  dimension: week_num {
    type: number
    sql: ${TABLE}.week_num ;;
    hidden: no
  }
  dimension: month_num {
    type: number
    sql: ${TABLE}.month_num ;;
    hidden: no
  }
  dimension: quarter_num {
    type: number
    sql: ${TABLE}.quarter_num ;;
    hidden: no
  }
  dimension: year_num {
    type: number
    sql: ${TABLE}.year_num ;;
    hidden: no
  }
  dimension: region {
    type: string
    sql: ${TABLE}.region ;;
    hidden: no
  }
  dimension: metro {
    type: string
    sql: ${TABLE}.metro ;;
    hidden: no
  }
  dimension: latitude {
    type: number
    sql: ${TABLE}.latitude ;;
    hidden: yes
  }
  dimension: longitude {
    type: number
    sql: ${TABLE}.longitude ;;
    hidden: yes
  }
  dimension: map_details {
    type: location
    sql_longitude: ${longitude} ;;
    sql_latitude:  ${latitude} ;;
    hidden: no
  }
  dimension_group: data_refresh {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.data_refresh ;;
    hidden: no
  }
  dimension: last_data_refreshed {
    type: string
    sql: FORMAT_TIMESTAMP('%d-%b-%Y %I:%M %p, %Z', ${data_refresh_raw}, 'America/Los_Angeles');;
    html: <p style="font-size:15px; line-height:30px; text-align: left;">
            <b>Last Data Refreshed</b> : {{value}}
         </p>
          ;;
    hidden: no
  }
  dimension: region_agg {
    type: string
    sql: MAX(${region}) ;;
    hidden: no
  }
  view_label: "Metric Details"
}
