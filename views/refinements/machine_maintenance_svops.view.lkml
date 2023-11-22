include: "/views/refinements/*.view.lkml"

view: +three_pdc_metrics_demo{

  dimension: mm_svops_detail_data {
    hidden: yes
    sql: ${TABLE}.mm_svops_detail_data ;;
  }
  dimension: mm_svops_summary_data {
    hidden: yes
    sql: ${TABLE}.mm_svops_summary_data ;;
  }
  dimension: mm_svops_slo_count {
    type: number
    sql: ${TABLE}.mm_svops_slo_count ;;
    hidden: no
  }
  dimension: mm_svops_slo_sum {
    type: number
    sql: ${TABLE}.mm_svops_slo_sum ;;
    hidden: no
  }
}

view: _mm_svops_detail_data {

  dimension: bug_id {
    type: string
    sql: bug_id ;;
    hidden: no
  }
  dimension: hwops_availability_score {
    type: number
    sql: hwops_availability_score ;;
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

view: _mm_svops_summary_data {

  dimension: hwops_time_above_buffer {
    type: number
    sql: hwops_time_above_buffer ;;
    hidden: no
  }
  dimension: metro_tier {
    type: string
    sql: metro_tier ;;
    hidden: no
  }
  dimension: total_time {
    type: number
    sql: total_time ;;
    hidden: no
  }
}
