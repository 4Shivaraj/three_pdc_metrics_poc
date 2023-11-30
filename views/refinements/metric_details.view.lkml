########################################################################################################
# Update Log:
#   29/11/2023 — Metric detail view consist of start dates and map details
########################################################################################################

########################################################################################################
# Description:
#   Purpose of this table is to include all start date and map details for metrics
########################################################################################################

include: "/views/raw/*.view.lkml"

view: +three_pdc_metrics_demo {

########################################################################################################
#####
##### START OF DIMENSIONS {
#####
########################################################################################################

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

  dimension: _week_start_date {
    type: string
    sql: CAST(${week_start_date} as string) ;;
    hidden: no
  }

  dimension: _month_start_date {
    type: string
    sql: CAST(${month_start_date} as string) ;;
    hidden: no
  }

  dimension: _quarter_start_date {
    type: string
    sql: CAST(${quarter_start_date} as string) ;;
    hidden: no
  }

  dimension: _year_start_date {
    type: string
    sql: CAST(${year_start_date} as string) ;;
    hidden: no
  }

  parameter: param_duration_type {
    type: unquoted
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
    hidden: no
    label: "Duration Type"
  }

  dimension: p_duration_date {
    sql:
    {% if param_duration_type._parameter_value == 'Year' %}
    ${_year_start_date}
    {% elsif param_duration_type._parameter_value == 'Quarter' %}
    ${_quarter_start_date}
    {% elsif param_duration_type._parameter_value == 'Month' %}
    ${_month_start_date}
    {% elsif param_duration_type._parameter_value == 'Week' %}
    ${_week_start_date}
    {% endif %};;
    hidden: no
    label: "Duration Date"
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

########################################################################################################
#####
##### END OF DIMENSIONS }
#####
########################################################################################################
########################################################################################################
#####
##### START OF CUSTOM DIMENSIONS {
#####
########################################################################################################

# [CUSTOM DIMENSIONS HERE]

########################################################################################################
#####
##### END OF CUSTOM DIMENSIONS }
#####
########################################################################################################
########################################################################################################
#####
##### START OF MEASURES {
#####
########################################################################################################

# [MEASURES HERE]

########################################################################################################
#####
##### END OF MEASURES }
#####
########################################################################################################
########################################################################################################
#####
##### START OF SETS {
#####
########################################################################################################

# [SETS HERE]

########################################################################################################
#####
##### END OF SETS }
#####
########################################################################################################
# }
