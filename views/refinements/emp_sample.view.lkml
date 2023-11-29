
view: emp_sample {
  derived_table: {
    sql: select 1 as id,Date(2023,01,01) as Year_start_date,Date(2023,10,01) as month_start_date,10000 as sal union all
      select 2 as id,Date(2022,01,01) as Year_start_date,Date(2023,09,01) as month_start_date,40000 as sal union all
      select 3 as id,Date(2021,01,01) as Year_start_date,Date(2023,08,01) as month_start_date,80000 as sal union all
      select 4 as id,Date(2020,01,01) as Year_start_date,Date(2023,07,01) as month_start_date,40000 as sal ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: id {
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: year_start_date {
    type: string
    sql: CAST(${TABLE}.Year_start_date as string) ;;
  }

  dimension: month_start_date {
    type: string
    sql: CAST(${TABLE}.month_start_date as string);;
  }

  dimension: sal {
    type: number
    sql: ${TABLE}.sal ;;
  }


         #######   Parameter   #######

  parameter: Duration_type{
    type: unquoted

    allowed_value: {
      value: "Year"
      label: "year"
    }
    allowed_value: {
      value: "Month"
      label: "month"
    }
  }

      #######  Dynamic Dimension ######

  dimension: Duration_date {
    sql:
    {% if Duration_type._parameter_value == 'Year' %}
      ${year_start_date}
    {% else %}
      ${month_start_date}
    {% endif %};;
  }

  set: detail {
    fields: [
        id,
  year_start_date,
  month_start_date,
  sal
    ]
  }
}
