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
    hidden: yes
    view_label: "Machine Maintenance"
  }
  dimension: mmt1_slo_sum {
    type: number
    sql: ${TABLE}.mmt1_slo_sum ;;
    hidden: yes
    view_label: "Machine Maintenance"
  }
  dimension: mmt23_slo_count {
    type: number
    sql: ${TABLE}.mmt23_slo_count ;;
    hidden: yes
    view_label: "Machine Maintenance"
  }
  dimension: mmt23_slo_sum {
    type: number
    sql: ${TABLE}.mmt23_slo_sum ;;
    hidden: yes
    view_label: "Machine Maintenance"
  }
  measure: mmt1_slo_average_score_base {
    type: number
    sql: ROUND((1.0 - SAFE_DIVIDE(SUM(${mmt1_slo_sum}), SUM(${mmt1_slo_count}))) * 100, 2) ;;
    html:
    {% if value >= 99 %}
    <p style="color: black; background-color: #4285f4;">{{ value }}%</p>
    {% elsif value < 99 %}
    <p style="color: black; background-color: #fbc02d;">{{ value }}%</p>
    {% elsif value < 90 %}
    <p style="color: black; background-color: #db4437;">{{ value }}%</p>
    {% endif %}
    ;;
    hidden: no
    value_format: "0.00\%"
    view_label: "Machine Maintenance"
    label: "MM Tier1 SLO Avg Score (Target: 99%)"
  }
  measure: mmt23_slo_average_score_base {
    type: number
    sql: ROUND((1.0 - SAFE_DIVIDE(SUM(${mmt23_slo_sum}), SUM(${mmt23_slo_count}))) * 100, 2) ;;
    html:
    {% if value >= 90 %}
    <p style="color: black; background-color: #4285f4;">{{ value }}%</p>
    {% elsif value < 90 %}
    <p style="color: black; background-color: #fbc02d;">{{ value }}%</p>
    {% elsif value < 85 %}
    <p style="color: black; background-color: #db4437;">{{ value }}%</p>
    {% endif %}
    ;;
    hidden: no
    value_format: "0.00\%"
    view_label: "Machine Maintenance"
    label: "MM Tier 2&3 SLO Avg Score (Target: 99%)"
  }
  measure: p_slo_average_score {
    type: string
    sql: CASE
        WHEN {{ _mm_summary_data.param_metro_tier_type._parameter_value }} = 'Tier 1' THEN ${mmt1_slo_average_score_base}
        WHEN {{ _mm_summary_data.param_metro_tier_type._parameter_value }} = 'Tier 2' OR {{  _mm_summary_data.param_metro_tier_type._parameter_value }} = 'Tier 3' THEN ${mmt23_slo_average_score_base}
      END;;
    # html:
    # {% if value >= 90 %}
    # <p style="color: black; background-color: #4285f4;">{{ value }}%</p>
    # {% elsif value < 90 %}
    # <p style="color: black; background-color: #fbc02d;">{{ value }}%</p>
    # {% elsif value < 85 %}
    # <p style="color: black; background-color: #db4437;">{{ value }}%</p>
    # {% endif %}
    # ;;
    hidden: no
    value_format: "0.00\%"
    view_label: "Machine Maintenance"
  }
  view_label: "Machine Maintenance"
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

  # dimension: metro_tier {
  #   type: string
  #   sql: CASE
  #       WHEN {{ _mm_summary_data.param_metro_tier_type._parameter_value }} = 'Tier 1' THEN ${mm_metro_tier} = 'Tier 1'
  #       WHEN {{ _mm_summary_data.param_metro_tier_type._parameter_value }} = 'Tier 1' THEN ${mm_metro_tier} = 'Tier 2'
  #       WHEN {{ _mm_summary_data.param_metro_tier_type._parameter_value }} = 'Tier 3' THEN ${mm_metro_tier} = 'Tier 3'
  #     END;;
  #   hidden: no
  # }
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
  view_label: "Machine Maintenance"
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
  measure: ooslo_average_score {
    type: number
    sql: ROUND(AVG(CAST((${time_above_buffer}) AS FLOAT64) / CAST((${total_time}) AS FLOAT64))* 100, 2) ;;

    hidden: no
  }
  parameter: param_metro_tier_type {
    type: string
    allowed_value: {
      label: "Tier 1"
      value: "Tier 1"
    }
    allowed_value: {
      label: "Tier 2"
      value: "Tier 2"
    }
    allowed_value: {
      label: "Tier 3"
      value: "Tier 3"
    }
    hidden: no
  }
  measure: p_ooslo_average_score {
    type: string
    sql: CASE
            WHEN {% parameter param_metro_tier_type %} = 'Tier 1' THEN ${ooslo_average_score}
            ELSE ${ooslo_average_score}
          END;;
    # html:
    # {% if value >= 90 %}
    # <p style="color: black; background-color: #4285f4;">{{ value }}%</p>
    # {% elsif value < 90 %}
    # <p style="color: black; background-color: #fbc02d;">{{ value }}%</p>
    # {% elsif value < 85 %}
    # <p style="color: black; background-color: #db4437;">{{ value }}%</p>
    # {% endif %}
    # ;;
    hidden: no
    value_format: "0.00\%"
  }

  measure: target {
    type: number
    sql: 0.99 * 100 ;;
    value_format: "0.00\%"
    hidden: no
  }
  view_label: "Machine Maintenance Summary"
}
