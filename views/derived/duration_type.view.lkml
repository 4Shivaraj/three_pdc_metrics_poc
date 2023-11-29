view: v_duration_date {
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

  derived_table: {
    sql: WITH
          RawDates AS (
            SELECT
            raw_date,
            DATE_TRUNC(raw_date, WEEK(MONDAY)) AS week_start_date,
            DENSE_RANK() OVER (ORDER BY DATE_TRUNC(raw_date, WEEK (MONDAY)) DESC) AS week_num,
            DATE_TRUNC(raw_date, MONTH) AS month_start_date,
            DENSE_RANK() OVER (ORDER BY DATE_TRUNC(raw_date, MONTH) DESC) AS month_num,
            DATE_TRUNC(raw_date, QUARTER) AS quarter_start_date,
            DENSE_RANK() OVER (ORDER BY DATE_TRUNC(raw_date, QUARTER) DESC) AS quarter_num,
            DATE_TRUNC(raw_date, YEAR) AS year_start_date,
            DENSE_RANK() OVER (ORDER BY DATE_TRUNC(raw_date, YEAR) DESC) AS year_num,
            FROM
            UNNEST (
              GENERATE_DATE_ARRAY (
              CURRENT_DATE("America/Los_Angeles"),
              DATE_SUB(CURRENT_DATE("America/Los_Angeles"), INTERVAL 6 YEAR),
              INTERVAL -1 DAY)) AS raw_date
          )
          SELECT DISTINCT
          CAST (
          CASE
            WHEN {% parameter param_duration_type %} = 'Year' THEN year_start_date
            WHEN {% parameter param_duration_type %} = 'Quarter' THEN quarter_start_date
            WHEN {% parameter param_duration_type %} = 'Month' THEN month_start_date
            WHEN {% parameter param_duration_type %} = 'Week' THEN Week_start_date
          ELSE year_start_date
          END AS STRING)
          AS duration_start_date
          FROM RawDates
          WHERE
          CASE
          WHEN {% parameter param_duration_type %} = 'Year' THEN year_num
          WHEN {% parameter param_duration_type %} = 'Quarter' THEN quarter_num
          WHEN {% parameter param_duration_type %} = 'Month' THEN month_num
          WHEN {% parameter param_duration_type %} = 'Week' THEN week_num
          END
          <= CASE
          WHEN {% parameter param_duration_type %} = 'Year' THEN 5
          WHEN {% parameter param_duration_type %} = 'Quarter' THEN 8
          WHEN {% parameter param_duration_type %} = 'Month' THEN 12
          WHEN {% parameter param_duration_type %} = 'Week' THEN 26
          END
  ;;
  }

  dimension: duration_start_date {
    type: string
    sql: ${TABLE}.duration_start_date ;;
    hidden: no
  }
}
