########################################################################################################
# Update Log:
#   29/11/2023 — Data Security
########################################################################################################

########################################################################################################
# Description:
#   Purpose of this table is to include all the details of Data security
########################################################################################################

include: "/views/refinements/*.view.lkml"

view: +three_pdc_metrics_demo{

##### DIMENSIONS

  dimension: ds_detail_data {
    sql: ${TABLE}.ds_detail_data ;;
    view_label: "Data Security"
    hidden: yes
  }
  dimension: sdd_hwops_violations {
    type: number
    sql: ${TABLE}.ds_hwops_violations ;;
    label: "Slip Count"
    view_label: "Data Security"
    hidden: no
  }
  dimension: sdd_processed_count {
    type: number
    sql: ${TABLE}.ds_processed_count ;;
    label: "Processed Count"
    view_label: "Data Security"
    hidden: no
  }

##### MEASURES

  measure: sdd_slo_score_base {
    type: number
    sql: ROUND((1.0 - SAFE_DIVIDE(SUM(${sdd_hwops_violations}), SUM(${sdd_processed_count}))) * 100 ,2) ;;
    html:
    {% if value == 100 %}
    <p style="color: black; background-color: #4285f4;">{{ value }}%</p>
    {% elsif value < 95 %}
    <p style="color: black; background-color: #db4437;">{{ value }}%</p>
    {% elsif value < 100 %}
    <p style="color: black; background-color: #fbc02d;">{{ value }}%</p>
    {% endif %}
    ;;
    value_format: "0.00\%"
    label: "Data Security (Target: 100%)"
    # label: "SLO Score"
    link: {
      label: "3PDC Data Security"
      url: "/dashboards/three_pdc_metrics_poc::3pdc_data_security?Region={{ _filters['three_pdc_metrics_demo.region']| url_encode }}&Metro={{ _filters['three_pdc_metrics_demo.metro']| url_encode }}&Duration%20Type={{ _filters['three_pdc_metrics_demo.param_duration_type']| url_encode }}&Duration%20Date={{ _filters['three_pdc_metrics_demo.p_duration_date']| url_encode }}"
    }
    view_label: "Data Security"
    hidden: no
  }
  measure: ds_target {
    type: number
    sql: 1 * 100 ;;
    value_format: "0.00\%"
    label: "Target"
    view_label: "Data Security"
    hidden: no
  }
}

view: _ds_detail_data {

##### DIMENSIONS

  dimension: building {
    type: string
    sql: _ds_detail_data.building ;;
    view_label: "Data Security"
    hidden: no
  }
  dimension: efs_tiers {
    type: string
    sql: _ds_detail_data.efs_tiers ;;
    view_label: "Data Security"
    hidden: no
  }
  dimension: hwops_violations {
    type: number
    sql: _ds_detail_data.hwops_violations ;;
    view_label: "Data Security"
    hidden: no
  }
  dimension: managed_by_google {
    type: string
    sql: _ds_detail_data.managed_by_google ;;
    view_label: "Data Security"
    hidden: no
  }
  dimension: slip_details {
    type: string
    sql: _ds_detail_data.slip_details ;;
    view_label: "Data Security"
    hidden: no
  }
}
