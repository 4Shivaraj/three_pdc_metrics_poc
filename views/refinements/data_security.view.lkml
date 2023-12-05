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
    hidden: yes
  }
  dimension: sdd_hwops_violations {
    type: number
    sql: ${TABLE}.ds_hwops_violations ;;
    hidden: no
    view_label: "Data Security"
  }
  dimension: sdd_processed_count {
    type: number
    sql: ${TABLE}.ds_processed_count ;;
    hidden: no
    view_label: "Data Security"
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
    hidden: no
    value_format: "0.00\%"
    label: "Data Security (Target: 100%)"
    view_label: "Data Security"
    link: {
      label: "3PDC Data Security"
      url: "https://69af6669-814a-475b-8caf-6e43a13b16e2.looker.app/dashboards/22?&Region={{ _filters['three_pdc_metrics_demo.region']| url_encode }}&Metro={{ _filters['three_pdc_metrics_demo.metro']| url_encode }}"
    }
  }
  measure: target {
    type: number
    sql: 1 ;;
    hidden: no
    view_label: "Data Security"
  }
}

view: _ds_detail_data {

##### DIMENSIONS

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
