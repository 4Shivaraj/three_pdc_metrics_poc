########################################################################################################
# Update Log:
#   29/11/2023 — Edge Repairs
########################################################################################################

########################################################################################################
# Description:
#   Purpose of this table is to include all the details of Edge Repairs.
########################################################################################################

include: "/views/refinements/*.view.lkml"

view: +three_pdc_metrics_demo{

##### DIMENSIONS

  dimension: er_detail_data {
    sql: ${TABLE}.er_detail_data ;;
    view_label: "Edge Repair"
    hidden: yes
  }
  dimension: er_in_slo {
    type: number
    sql: ${TABLE}.er_in_slo ;;
    view_label: "Edge Repair"
    hidden: no
  }
  dimension: er_out_slo {
    type: number
    sql: ${TABLE}.er_out_slo ;;
    view_label: "Edge Repair"
    hidden: no
  }
  dimension: er_total {
    type: number
    sql: ${TABLE}.er_total ;;
    view_label: "Edge Repair"
    hidden: no
  }

##### MEASURES

  measure: er_slo_score {
    type: number
    sql: ROUND((SUM(${er_in_slo}) / SUM(${er_total})) * 100, 2) ;;
    html:
    {% if value >= 85 %}
    <p style="color: black; background-color: #4285f4;">{{ value }}%</p>
    {% elsif value < 85 %}
    <p style="color: black; background-color: #fbc02d;">{{ value }}%</p>
    {% elsif value < 80 %}
    <p style="color: black; background-color: #db4437;">{{ value }}%</p>
    {% endif %}
    ;;
    link: {
      label: "3PDC Edge Repair"
      url: "https://69af6669-814a-475b-8caf-6e43a13b16e2.looker.app/dashboards/26?&Region={{ _filters['three_pdc_metrics_demo.region']| url_encode }}&Metro={{ _filters['three_pdc_metrics_demo.metro']| url_encode }}"
    }
    value_format: "0.00\%"
    label: "Edge Repair (Target: 85%)"
    view_label: "Edge Repair"
    hidden: no
  }
  measure: global {
    type: number
    sql: ${er_slo_score} ;;
    value_format: "0.00\%"
    view_label: "Edge Repair"
    hidden: no
  }
}

view: _er_detail_data {

##### DIMENSIONS

  dimension: bug_id {
    type: number
    sql: _er_detail_data.bug_id ;;
    view_label: "Edge Repair"
    hidden: no
  }
  dimension: edge_tier {
    type: number
    sql: _er_detail_data.edge_tier ;;
    view_label: "Edge Repair"
    hidden: no
  }
  dimension: efs_metro_lead {
    type: string
    sql: _er_detail_data.efs_metro_lead ;;
    view_label: "Edge Repair"
    hidden: no
  }
  dimension: efs_metro_lead_om {
    type: string
    sql: _er_detail_data.efs_metro_lead_om ;;
    view_label: "Edge Repair"
    hidden: no
  }
  dimension: efs_pm {
    type: string
    sql: _er_detail_data.efs_pm ;;
    view_label: "Edge Repair"
    hidden: no
  }
  dimension: in_slo {
    type: number
    sql: _er_detail_data.in_slo ;;
    view_label: "Edge Repair"
    hidden: no
  }
  dimension: metro_utilization {
    type: number
    sql: _er_detail_data.metro_utilization ;;
    view_label: "Edge Repair"
    hidden: no
  }
  dimension: mw_link {
    type: string
    sql: _er_detail_data.mw_link ;;
    view_label: "Edge Repair"
    hidden: no
  }
  dimension: nbr_of_repairs {
    type: number
    sql: _er_detail_data.nbr_of_repairs ;;
    view_label: "Edge Repair"
    hidden: no
  }
  dimension: out_of_slo_duration_days {
    type: number
    sql: _er_detail_data.out_of_slo_duration_days ;;
    view_label: "Edge Repair"
    hidden: no
  }
  dimension: out_of_slo_since {
    type: string
    sql: _er_detail_data.out_of_slo_since ;;
    view_label: "Edge Repair"
    hidden: no
  }
  dimension: out_slo {
    type: number
    sql: _er_detail_data.out_slo ;;
    view_label: "Edge Repair"
    hidden: no
  }
  dimension: percentage_in_repairs {
    type: number
    sql: _er_detail_data.percentage_in_repairs ;;
    view_label: "Edge Repair"
    hidden: no
  }
  dimension: sli {
    type: string
    sql: _er_detail_data.sli ;;
    view_label: "Edge Repair"
    hidden: no
  }
  dimension: slo_order {
    type: number
    sql: _er_detail_data.slo_order ;;
    view_label: "Edge Repair"
    hidden: no
  }
  dimension: slo_status {
    type: string
    sql: _er_detail_data.slo_status ;;
    view_label: "Edge Repair"
    hidden: no
  }
  dimension: slo_violation_bug {
    type: string
    sql: _er_detail_data.slo_violation_bug ;;
    view_label: "Edge Repair"
    hidden: no
  }
  dimension: total {
    type: number
    sql: _er_detail_data.total ;;
    view_label: "Edge Repair"
    hidden: no
  }

##### MEASURES

  measure: out_slo_bug {
    type: number
    sql: CASE WHEN ${out_slo} = 1 THEN ${bug_id} ELSE NULL END ;;
    label: "Distinct Out of SLO Bug#"
    view_label: "Edge Repair"
    hidden: no
  }
  measure: edge_repiar_target {
    type: number
    sql: 0.99 * 100 ;;
    value_format: "0.00\%"
    view_label: "Edge Repair"
    hidden: no
  }
  measure: slo_score {
    type: number
    sql: ROUND(IFNULL(SAFE_DIVIDE(CAST(IFNULL(SUM(${in_slo}),0) AS FLOAT64), CAST(IFNULL(SUM(${total}),0) AS FLOAT64)),0)* 100, 2)  ;;
    value_format: "0.00\%"
    view_label: "Edge Repair"
    hidden: no
  }
}
