include: "/views/refinements/*.view.lkml"

view: +three_pdc_metrics_demo{

  dimension: er_detail_data {
    hidden: yes
    sql: ${TABLE}.er_detail_data ;;
  }
  dimension: er_in_slo {
    type: number
    sql: ${TABLE}.er_in_slo ;;
    hidden: yes
    view_label: "Edge Repair"
  }
  dimension: er_out_slo {
    type: number
    sql: ${TABLE}.er_out_slo ;;
    hidden: yes
    view_label: "Edge Repair"
  }
  dimension: er_total {
    type: number
    sql: ${TABLE}.er_total ;;
    hidden: yes
    view_label: "Edge Repair"
  }
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
    hidden: no
    value_format: ".00\%"
    view_label: "Edge Repair"
    label: "Edge Repair (Target: 85%)"
  }

}

view: _er_detail_data {
  dimension: bug_id {
    type: number
    sql: bug_id ;;
    hidden: no
  }
  dimension: edge_tier {
    type: number
    sql: edge_tier ;;
    hidden: no
  }
  dimension: efs_metro_lead {
    type: string
    sql: efs_metro_lead ;;
    hidden: no
  }
  dimension: efs_metro_lead_om {
    type: string
    sql: efs_metro_lead_om ;;
    hidden: no
  }
  dimension: efs_pm {
    type: string
    sql: efs_pm ;;
    hidden: no
  }
  dimension: in_slo {
    type: number
    sql: in_slo ;;
    hidden: no
  }
  dimension: metro_utilization {
    type: number
    sql: metro_utilization ;;
    hidden: no
  }
  dimension: mw_link {
    type: string
    sql: mw_link ;;
    hidden: no
  }
  dimension: nbr_of_repairs {
    type: number
    sql: nbr_of_repairs ;;
    hidden: no
  }
  dimension: out_of_slo_duration_days {
    type: number
    sql: out_of_slo_duration_days ;;
    hidden: no
  }
  dimension: out_of_slo_since {
    type: string
    sql: out_of_slo_since ;;
    hidden: no
  }
  dimension: out_slo {
    type: number
    sql: out_slo ;;
    hidden: no
  }
  dimension: percentage_in_repairs {
    type: number
    sql: percentage_in_repairs ;;
    hidden: no
  }
  dimension: sli {
    type: string
    sql: sli ;;
    hidden: no
  }
  dimension: slo_order {
    type: number
    sql: slo_order ;;
    hidden: no
  }
  dimension: slo_status {
    type: string
    sql: slo_status ;;
  }
  dimension: slo_violation_bug {
    type: string
    sql: slo_violation_bug ;;
  }
  dimension: total {
    type: number
    sql: total ;;
    hidden: no
  }
}
