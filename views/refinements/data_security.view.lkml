include: "/views/refinements/*.view.lkml"

view: +three_pdc_metrics_demo{

  dimension: ds_detail_data {
    sql: ${TABLE}.ds_detail_data ;;
    hidden: yes
  }
  dimension: ds_hwops_violations {
    type: number
    sql: ${TABLE}.ds_hwops_violations ;;
    hidden: no
  }
  dimension: ds_processed_count {
    type: number
    sql: ${TABLE}.ds_processed_count ;;
    hidden: no
  }
}

view: _ds_detail_data {
  dimension: building {
    type: string
    sql: building ;;
    hidden: no
  }
  dimension: efs_tiers {
    type: string
    sql: efs_tiers ;;
    hidden: no
  }
  dimension: hwops_violations {
    type: number
    sql: hwops_violations ;;
    hidden: no
  }
  dimension: managed_by_google {
    type: string
    sql: managed_by_google ;;
    hidden: no
  }
  dimension: slip_details {
    type: string
    sql: slip_details ;;
    hidden: no
  }
}
