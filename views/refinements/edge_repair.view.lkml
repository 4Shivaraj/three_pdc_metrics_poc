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
    link: {
      label: "3PDC Edge Repair"
      url: "https://69af6669-814a-475b-8caf-6e43a13b16e2.looker.app/dashboards/26?&Region={{ _filters['three_pdc_metrics_demo.region']| url_encode }}&Metro={{ _filters['three_pdc_metrics_demo.metro']| url_encode }}"
    }
    hidden: no
    value_format: "0.00\%"
    view_label: "Edge Repair"
    label: "Edge Repair (Target: 85%)"
  }

  measure: global {
    type: number
    sql: ${er_slo_score} ;;
    html:
    {% if value >= 85 %}
    <p style="color: black; background-color: #4285f4;">{{ value }}%</p>
    {% elsif value < 85 %}
    <p style="color: black; background-color: #fbc02d;">{{ value }}%</p>
    {% elsif value < 80 %}
    <p style="color: black; background-color: #db4437;">{{ value }}%</p>
    {% endif %}
    ;;
    value_format: "0.00\%"
    hidden: no
    view_label: "Edge Repair"
  }

}

view: _er_detail_data {
  dimension: bug_id {
    type: number
    sql: _er_detail_data.bug_id ;;
    hidden: no
  }
  dimension: edge_tier {
    type: number
    sql: _er_detail_data.edge_tier ;;
    hidden: no
  }
  dimension: efs_metro_lead {
    type: string
    sql: _er_detail_data.efs_metro_lead ;;
    hidden: no
  }
  dimension: efs_metro_lead_om {
    type: string
    sql: _er_detail_data.efs_metro_lead_om ;;
    hidden: no
  }
  dimension: efs_pm {
    type: string
    sql: _er_detail_data.efs_pm ;;
    hidden: no
  }
  dimension: in_slo {
    type: number
    sql: _er_detail_data.in_slo ;;
    hidden: no
  }
  dimension: metro_utilization {
    type: number
    sql: _er_detail_data.metro_utilization ;;
    hidden: no
  }
  dimension: mw_link {
    type: string
    sql: _er_detail_data.mw_link ;;
    hidden: no
  }
  dimension: nbr_of_repairs {
    type: number
    sql: _er_detail_data.nbr_of_repairs ;;
    hidden: no
  }
  dimension: out_of_slo_duration_days {
    type: number
    sql: _er_detail_data.out_of_slo_duration_days ;;
    hidden: no
  }
  dimension: out_of_slo_since {
    type: string
    sql: _er_detail_data.out_of_slo_since ;;
    hidden: no
  }
  dimension: out_slo {
    type: number
    sql: _er_detail_data.out_slo ;;
    hidden: no
  }
  dimension: percentage_in_repairs {
    type: number
    sql: _er_detail_data.percentage_in_repairs ;;
    hidden: no
  }
  dimension: sli {
    type: string
    sql: _er_detail_data.sli ;;
    hidden: no
  }
  dimension: slo_order {
    type: number
    sql: _er_detail_data.slo_order ;;
    hidden: no
  }
  dimension: slo_status {
    type: string
    sql: _er_detail_data.slo_status ;;
  }
  dimension: slo_violation_bug {
    type: string
    sql: _er_detail_data.slo_violation_bug ;;
  }
  dimension: total {
    type: number
    sql: _er_detail_data.total ;;
    hidden: no
  }
  measure: out_slo_bug {
    type: number
    sql: CASE WHEN ${out_slo} = 1 THEN ${bug_id} ELSE NULL END ;;
    label: "Distinct Out of SLO Bug#"
  }
  measure: edge_repiar_target {
    type: number
    sql: 0.99 * 100 ;;
    value_format: "0.00\%"
    hidden: no
  }
  measure: slo_score {
    type: number
    sql: ROUND(IFNULL(SAFE_DIVIDE(CAST(IFNULL(SUM(${in_slo}),0) AS FLOAT64), CAST(IFNULL(SUM(${total}),0) AS FLOAT64)),0)* 100, 2)  ;;
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
    value_format: "0.00\%"
    view_label: "Edge Repair"
  }
}
