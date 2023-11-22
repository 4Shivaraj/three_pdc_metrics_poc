include: "/views/refinements/*.view.lkml"

view: +three_pdc_metrics_demo{

   dimension: mm_detail_data {
    hidden: yes
    sql: ${TABLE}.mm_detail_data ;;
  }
  dimension: mm_summary_data {
    hidden: yes
    sql: ${TABLE}.mm_summary_data ;;
  }
  dimension: mmt1_slo_count {
    type: number
    sql: ${TABLE}.mmt1_slo_count ;;
    hidden: no
  }
  dimension: mmt1_slo_sum {
    type: number
    sql: ${TABLE}.mmt1_slo_sum ;;
    hidden: no
  }
  dimension: mmt23_slo_count {
    type: number
    sql: ${TABLE}.mmt23_slo_count ;;
    hidden: no
  }
  dimension: mmt23_slo_sum {
    type: number
    sql: ${TABLE}.mmt23_slo_sum ;;
    hidden: no
  }
}


view: _mm_detail_data {

  dimension: aging {
    type: number
    sql: aging ;;
    hidden: no
  }
  dimension: bug_id {
    type: string
    sql: bug_id ;;
    hidden: no
  }
  dimension: cluster {
    type: string
    sql: cluster ;;
    hidden: no
  }
  dimension: gpn {
    type: string
    sql: gpn ;;
    hidden: no
  }
  dimension: gpn_part_name {
    type: string
    sql: gpn_part_name ;;
    hidden: no
  }
  dimension: is_test {
    type: string
    sql: is_test ;;
    hidden: no
  }
  dimension: metro_tier {
    type: string
    sql: metro_tier ;;
    hidden: no
  }
  dimension: pool {
    type: string
    sql: pool ;;
    hidden: no
  }
  dimension: slip_category {
    type: string
    sql: slip_category ;;
    hidden: no
  }
  dimension: slip_chart_order {
    type: number
    sql: slip_chart_order ;;
    hidden: no
  }
  dimension: slip_note {
    type: string
    sql: slip_note ;;
    hidden: no
  }
  dimension: slip_source {
    type: string
    sql: slip_source ;;
    hidden: no
  }
  dimension: slip_type {
    type: string
    sql: slip_type ;;
    hidden: no
  }
}

view: _mm_summary_data {

  dimension: is_test {
    type: string
    sql: is_test ;;
    hidden: no
  }
  dimension: metro_tier {
    type: string
    sql: metro_tier ;;
    hidden: no
  }
  dimension: three_pdc_metrics_demo__mm_summary_data {
    type: string
    hidden: yes
    sql: three_pdc_metrics_demo__mm_summary_data ;;
  }
  dimension: time_above_buffer {
    type: number
    sql: time_above_buffer ;;
    hidden: no
  }
  dimension: total_time {
    type: number
    sql: total_time ;;
    hidden: no
  }
}
