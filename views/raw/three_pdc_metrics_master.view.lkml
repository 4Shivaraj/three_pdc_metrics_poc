  view: three_pdc_metrics_demo {
    sql_table_name: `three_pdc_metrics_poc.three_pdc_metrics_demo` ;;

    dimension: bct_detail_summary_data {
      hidden: yes
      sql: ${TABLE}.bct_detail_summary_data ;;
    }
    dimension: bct_met_count {
      type: number
      sql: ${TABLE}.bct_met_count ;;
    }
    dimension: bct_miss_count {
      type: number
      sql: ${TABLE}.bct_miss_count ;;
    }
    dimension: bct_total_count {
      type: number
      sql: ${TABLE}.bct_total_count ;;
    }
    dimension: bm_active_bugs_detail_data {
      hidden: yes
      sql: ${TABLE}.bm_active_bugs_detail_data ;;
    }
    dimension: bm_closed_cnt {
      type: number
      sql: ${TABLE}.bm_closed_cnt ;;
    }
    dimension: bm_escalated_cnt {
      type: number
      sql: ${TABLE}.bm_escalated_cnt ;;
    }
    dimension: botd_detail_summary_data {
      hidden: yes
      sql: ${TABLE}.botd_detail_summary_data ;;
    }
    dimension: botd_met_count {
      type: number
      sql: ${TABLE}.botd_met_count ;;
    }
    dimension: botd_miss_count {
      type: number
      sql: ${TABLE}.botd_miss_count ;;
    }
    dimension: botd_total_count {
      type: number
      sql: ${TABLE}.botd_total_count ;;
    }
    dimension_group: calendar {
      type: time
      timeframes: [raw, date, week, month, quarter, year]
      convert_tz: no
      datatype: date
      sql: ${TABLE}.calendar_date ;;
    }
    dimension_group: data_refresh {
      type: time
      timeframes: [raw, time, date, week, month, quarter, year]
      sql: ${TABLE}.data_refresh ;;
    }
    dimension: ds_detail_data {
      hidden: yes
      sql: ${TABLE}.ds_detail_data ;;
    }
    dimension: ds_hwops_violations {
      type: number
      sql: ${TABLE}.ds_hwops_violations ;;
    }
    dimension: ds_processed_count {
      type: number
      sql: ${TABLE}.ds_processed_count ;;
    }
    dimension: ds_rca_detail_data {
      hidden: yes
      sql: ${TABLE}.ds_rca_detail_data ;;
    }
    dimension: ds_rca_om_verified_met_sli_count {
      type: number
      sql: ${TABLE}.ds_rca_om_verified_met_sli_count ;;
    }
    dimension: ds_rca_om_verified_met_sli_sum {
      type: number
      sql: ${TABLE}.ds_rca_om_verified_met_sli_sum ;;
    }
    dimension: ds_rca_root_cause_met_sli_count {
      type: number
      sql: ${TABLE}.ds_rca_root_cause_met_sli_count ;;
    }
    dimension: ds_rca_root_cause_met_sli_sum {
      type: number
      sql: ${TABLE}.ds_rca_root_cause_met_sli_sum ;;
    }
    dimension: er_detail_data {
      hidden: yes
      sql: ${TABLE}.er_detail_data ;;
    }
    dimension: er_in_slo {
      type: number
      sql: ${TABLE}.er_in_slo ;;
    }
    dimension: er_out_slo {
      type: number
      sql: ${TABLE}.er_out_slo ;;
    }
    dimension: er_total {
      type: number
      sql: ${TABLE}.er_total ;;
    }
    dimension: irpt_active_bugs_detail_data {
      hidden: yes
      sql: ${TABLE}.irpt_active_bugs_detail_data ;;
    }
    dimension: irpt_slo_met {
      type: number
      sql: ${TABLE}.irpt_slo_met ;;
    }
    dimension: irpt_summary_data {
      hidden: yes
      sql: ${TABLE}.irpt_summary_data ;;
    }
    dimension: irpt_total_bugs {
      type: number
      sql: ${TABLE}.irpt_total_bugs ;;
    }
    dimension: latitude {
      type: number
      sql: ${TABLE}.latitude ;;
    }
    dimension: longitude {
      type: number
      sql: ${TABLE}.longitude ;;
    }
    dimension: metro {
      type: string
      sql: ${TABLE}.metro ;;
    }
    dimension: mm_detail_data {
      hidden: yes
      sql: ${TABLE}.mm_detail_data ;;
    }
    dimension: mm_summary_data {
      hidden: yes
      sql: ${TABLE}.mm_summary_data ;;
    }
    dimension: mm_svops_detail_data {
      hidden: yes
      sql: ${TABLE}.mm_svops_detail_data ;;
    }
    dimension: mm_svops_slo_count {
      type: number
      sql: ${TABLE}.mm_svops_slo_count ;;
    }
    dimension: mm_svops_slo_sum {
      type: number
      sql: ${TABLE}.mm_svops_slo_sum ;;
    }
    dimension: mm_svops_summary_data {
      hidden: yes
      sql: ${TABLE}.mm_svops_summary_data ;;
    }
    dimension: mmt1_slo_count {
      type: number
      sql: ${TABLE}.mmt1_slo_count ;;
    }
    dimension: mmt1_slo_sum {
      type: number
      sql: ${TABLE}.mmt1_slo_sum ;;
    }
    dimension: mmt23_slo_count {
      type: number
      sql: ${TABLE}.mmt23_slo_count ;;
    }
    dimension: mmt23_slo_sum {
      type: number
      sql: ${TABLE}.mmt23_slo_sum ;;
    }
    dimension: month_num {
      type: number
      sql: ${TABLE}.month_num ;;
    }
    dimension_group: month_start {
      type: time
      timeframes: [raw, date, week, month, quarter, year]
      convert_tz: no
      datatype: date
      sql: ${TABLE}.month_start_date ;;
    }
    dimension: quarter_num {
      type: number
      sql: ${TABLE}.quarter_num ;;
    }
    dimension_group: quarter_start {
      type: time
      timeframes: [raw, date, week, month, quarter, year]
      convert_tz: no
      datatype: date
      sql: ${TABLE}.quarter_start_date ;;
    }
    dimension: region {
      type: string
      sql: ${TABLE}.region ;;
    }
    dimension: week_num {
      type: number
      sql: ${TABLE}.week_num ;;
    }
    dimension_group: week_start {
      type: time
      timeframes: [raw, date, week, month, quarter, year]
      convert_tz: no
      datatype: date
      sql: ${TABLE}.week_start_date ;;
    }
    dimension: year_num {
      type: number
      sql: ${TABLE}.year_num ;;
    }
    dimension_group: year_start {
      type: time
      timeframes: [raw, date, week, month, quarter, year]
      convert_tz: no
      datatype: date
      sql: ${TABLE}.year_start_date ;;
    }
    measure: count {
      type: count
    }
  }

  view: three_pdc_metrics_demo__ds_detail_data {

    dimension: building {
      type: string
      sql: building ;;
    }
    dimension: efs_tiers {
      type: string
      sql: efs_tiers ;;
    }
    dimension: hwops_violations {
      type: number
      sql: hwops_violations ;;
    }
    dimension: managed_by_google {
      type: string
      sql: managed_by_google ;;
    }
    dimension: slip_details {
      type: string
      sql: slip_details ;;
    }
    dimension: three_pdc_metrics_demo__ds_detail_data {
      type: string
      hidden: yes
      sql: three_pdc_metrics_demo__ds_detail_data ;;
    }
  }

  view: three_pdc_metrics_demo__er_detail_data {

    dimension: bug_id {
      type: number
      sql: bug_id ;;
    }
    dimension: edge_tier {
      type: number
      sql: edge_tier ;;
    }
    dimension: efs_metro_lead {
      type: string
      sql: efs_metro_lead ;;
    }
    dimension: efs_metro_lead_om {
      type: string
      sql: efs_metro_lead_om ;;
    }
    dimension: efs_pm {
      type: string
      sql: efs_pm ;;
    }
    dimension: in_slo {
      type: number
      sql: in_slo ;;
    }
    dimension: metro_utilization {
      type: number
      sql: metro_utilization ;;
    }
    dimension: mw_link {
      type: string
      sql: mw_link ;;
    }
    dimension: nbr_of_repairs {
      type: number
      sql: nbr_of_repairs ;;
    }
    dimension: out_of_slo_duration_days {
      type: number
      sql: out_of_slo_duration_days ;;
    }
    dimension: out_of_slo_since {
      type: string
      sql: out_of_slo_since ;;
    }
    dimension: out_slo {
      type: number
      sql: out_slo ;;
    }
    dimension: percentage_in_repairs {
      type: number
      sql: percentage_in_repairs ;;
    }
    dimension: sli {
      type: string
      sql: sli ;;
    }
    dimension: slo_order {
      type: number
      sql: slo_order ;;
    }
    dimension: slo_status {
      type: string
      sql: slo_status ;;
    }
    dimension: slo_violation_bug {
      type: string
      sql: slo_violation_bug ;;
    }
    dimension: three_pdc_metrics_demo__er_detail_data {
      type: string
      hidden: yes
      sql: three_pdc_metrics_demo__er_detail_data ;;
    }
    dimension: total {
      type: number
      sql: total ;;
    }
  }

  view: three_pdc_metrics_demo__mm_detail_data {

    dimension: aging {
      type: number
      sql: aging ;;
    }
    dimension: bug_id {
      type: string
      sql: bug_id ;;
    }
    dimension: cluster {
      type: string
      sql: cluster ;;
    }
    dimension: gpn {
      type: string
      sql: gpn ;;
    }
    dimension: gpn_part_name {
      type: string
      sql: gpn_part_name ;;
    }
    dimension: is_test {
      type: string
      sql: is_test ;;
    }
    dimension: metro_tier {
      type: string
      sql: metro_tier ;;
    }
    dimension: pool {
      type: string
      sql: pool ;;
    }
    dimension: slip_category {
      type: string
      sql: slip_category ;;
    }
    dimension: slip_chart_order {
      type: number
      sql: slip_chart_order ;;
    }
    dimension: slip_note {
      type: string
      sql: slip_note ;;
    }
    dimension: slip_source {
      type: string
      sql: slip_source ;;
    }
    dimension: slip_type {
      type: string
      sql: slip_type ;;
    }
    dimension: three_pdc_metrics_demo__mm_detail_data {
      type: string
      hidden: yes
      sql: three_pdc_metrics_demo__mm_detail_data ;;
    }
  }

  view: three_pdc_metrics_demo__mm_summary_data {

    dimension: is_test {
      type: string
      sql: is_test ;;
    }
    dimension: metro_tier {
      type: string
      sql: metro_tier ;;
    }
    dimension: three_pdc_metrics_demo__mm_summary_data {
      type: string
      hidden: yes
      sql: three_pdc_metrics_demo__mm_summary_data ;;
    }
    dimension: time_above_buffer {
      type: number
      sql: time_above_buffer ;;
    }
    dimension: total_time {
      type: number
      sql: total_time ;;
    }
  }

  view: three_pdc_metrics_demo__irpt_summary_data {

    dimension: bug_id {
      type: number
      sql: bug_id ;;
    }
    dimension: slo_all_met {
      type: number
      sql: slo_all_met ;;
    }
    dimension: three_pdc_metrics_demo__irpt_summary_data {
      type: string
      hidden: yes
      sql: three_pdc_metrics_demo__irpt_summary_data ;;
    }
  }

  view: three_pdc_metrics_demo__ds_rca_detail_data {

    dimension: bug_id {
      type: number
      sql: bug_id ;;
    }
    dimension: campus {
      type: string
      sql: campus ;;
    }
    dimension: location_type {
      type: string
      sql: location_type ;;
    }
    dimension: rca_duration_days {
      type: number
      sql: rca_duration_days ;;
    }
    dimension: slip_root_cause {
      type: string
      sql: slip_root_cause ;;
    }
    dimension: three_pdc_metrics_demo__ds_rca_detail_data {
      type: string
      hidden: yes
      sql: three_pdc_metrics_demo__ds_rca_detail_data ;;
    }
    dimension: verified_by_om_days {
      type: number
      sql: verified_by_om_days ;;
    }
    dimension: violation_type {
      type: string
      sql: violation_type ;;
    }
  }

  view: three_pdc_metrics_demo__mm_svops_detail_data {

    dimension: bug_id {
      type: string
      sql: bug_id ;;
    }
    dimension: hwops_availability_score {
      type: number
      sql: hwops_availability_score ;;
    }
    dimension: metro_tier {
      type: string
      sql: metro_tier ;;
    }
    dimension: pool {
      type: string
      sql: pool ;;
    }
    dimension: slip_category {
      type: string
      sql: slip_category ;;
    }
    dimension: slip_note {
      type: string
      sql: slip_note ;;
    }
    dimension: slip_source {
      type: string
      sql: slip_source ;;
    }
    dimension: slip_type {
      type: string
      sql: slip_type ;;
    }
    dimension: three_pdc_metrics_demo__mm_svops_detail_data {
      type: string
      hidden: yes
      sql: three_pdc_metrics_demo__mm_svops_detail_data ;;
    }
  }

  view: three_pdc_metrics_demo__mm_svops_summary_data {

    dimension: hwops_time_above_buffer {
      type: number
      sql: hwops_time_above_buffer ;;
    }
    dimension: metro_tier {
      type: string
      sql: metro_tier ;;
    }
    dimension: three_pdc_metrics_demo__mm_svops_summary_data {
      type: string
      hidden: yes
      sql: three_pdc_metrics_demo__mm_svops_summary_data ;;
    }
    dimension: total_time {
      type: number
      sql: total_time ;;
    }
  }

  view: three_pdc_metrics_demo__bct_detail_summary_data {

    dimension: bct_met_count {
      type: number
      sql: ${TABLE}.bct_met_count ;;
    }
    dimension: bct_miss_count {
      type: number
      sql: ${TABLE}.bct_miss_count ;;
    }
    dimension: bct_total_count {
      type: number
      sql: ${TABLE}.bct_total_count ;;
    }
    dimension: build_type {
      type: string
      sql: build_type ;;
    }
    dimension: comment {
      type: string
      sql: comment ;;
    }
    dimension: is_marine_or_payload {
      type: yesno
      sql: is_marine_or_payload ;;
    }
    dimension: marine_payload_flag {
      type: string
      sql: marine_payload_flag ;;
    }
    dimension: phase_id {
      type: string
      sql: phase_id ;;
    }
    dimension: phase_owner {
      type: string
      sql: phase_owner ;;
    }
    dimension: process_model {
      type: string
      sql: process_model ;;
    }
    dimension: root_cause_owner {
      type: string
      sql: root_cause_owner ;;
    }
    dimension: slip_code_tier_1 {
      type: string
      sql: slip_code_tier_1 ;;
    }
    dimension: slip_code_tier_2 {
      type: string
      sql: slip_code_tier_2 ;;
    }
    dimension: slo_slip_type {
      type: string
      sql: slo_slip_type ;;
    }
    dimension_group: slo_target {
      type: time
      timeframes: [raw, date, week, month, quarter, year]
      convert_tz: no
      datatype: date
      sql: slo_target_date ;;
    }
    dimension: three_pdc_metrics_demo__bct_detail_summary_data {
      type: string
      hidden: yes
      sql: three_pdc_metrics_demo__bct_detail_summary_data ;;
    }
    dimension: viewpoint_link {
      type: string
      sql: viewpoint_link ;;
    }
  }

  view: three_pdc_metrics_demo__botd_detail_summary_data {

    dimension: build_type {
      type: string
      sql: build_type ;;
    }
    dimension: builds_otd_denominator {
      type: number
      sql: builds_otd_denominator ;;
    }
    dimension: builds_otd_numerator {
      type: number
      sql: builds_otd_numerator ;;
    }
    dimension_group: completion {
      type: time
      timeframes: [raw, date, week, month, quarter, year]
      convert_tz: no
      datatype: date
      sql: completion_date ;;
    }
    dimension: miss_count {
      type: number
      sql: miss_count ;;
    }
    dimension: rack_type {
      type: string
      sql: rack_type ;;
    }
    dimension: slip_reason {
      type: string
      sql: slip_reason ;;
    }
    dimension: slip_reason_category {
      type: string
      sql: slip_reason_category ;;
    }
    dimension_group: slo_target {
      type: time
      timeframes: [raw, date, week, month, quarter, year]
      convert_tz: no
      datatype: date
      sql: slo_target_date ;;
    }
    dimension: three_pdc_metrics_demo__botd_detail_summary_data {
      type: string
      hidden: yes
      sql: three_pdc_metrics_demo__botd_detail_summary_data ;;
    }
    dimension: viewpoint_link {
      type: string
      sql: viewpoint_link ;;
    }
  }

  view: three_pdc_metrics_demo__bm_active_bugs_detail_data {

    dimension: assign_flg {
      type: string
      sql: assign_flg ;;
    }
    dimension: assignee {
      type: string
      sql: assignee ;;
    }
    dimension: assignment_slo {
      type: string
      sql: assignment_slo ;;
    }
    dimension: bug_id {
      type: string
      sql: bug_id ;;
    }
    dimension: bug_status {
      type: string
      sql: bug_status ;;
    }
    dimension: bug_type {
      type: string
      sql: bug_type ;;
    }
    dimension: closure_slo {
      type: string
      sql: closure_slo ;;
    }
    dimension_group: creation {
      type: time
      timeframes: [raw, date, week, month, quarter, year]
      convert_tz: no
      datatype: date
      sql: creation_date ;;
    }
    dimension_group: last_modified {
      type: time
      timeframes: [raw, date, week, month, quarter, year]
      convert_tz: no
      datatype: date
      sql: last_modified_date ;;
    }
    dimension: latest_component_path {
      type: string
      sql: latest_component_path ;;
    }
    dimension: manager_name {
      type: string
      sql: manager_name ;;
    }
    dimension: priority {
      type: string
      sql: priority ;;
    }
    dimension: response_slo {
      type: string
      sql: response_slo ;;
    }
    dimension: slo_flg {
      type: string
      sql: slo_flg ;;
    }
    dimension: slo_status {
      type: string
      sql: slo_status ;;
    }
    dimension: status {
      type: string
      sql: status ;;
    }
    dimension: three_pdc_metrics_demo__bm_active_bugs_detail_data {
      type: string
      hidden: yes
      sql: three_pdc_metrics_demo__bm_active_bugs_detail_data ;;
    }
    dimension: title {
      type: string
      sql: title ;;
    }
    dimension: total {
      type: number
      sql: total ;;
    }
  }

  view: three_pdc_metrics_demo__irpt_active_bugs_detail_data {

    dimension: assign_flg {
      type: string
      sql: assign_flg ;;
    }
    dimension: assignee {
      type: string
      sql: assignee ;;
    }
    dimension: assignment_slo {
      type: string
      sql: assignment_slo ;;
    }
    dimension: bug_id {
      type: string
      sql: bug_id ;;
    }
    dimension: bug_status {
      type: string
      sql: bug_status ;;
    }
    dimension: bug_type {
      type: string
      sql: bug_type ;;
    }
    dimension: closure_slo {
      type: string
      sql: closure_slo ;;
    }
    dimension_group: creation {
      type: time
      timeframes: [raw, date, week, month, quarter, year]
      convert_tz: no
      datatype: date
      sql: creation_date ;;
    }
    dimension_group: last_modified {
      type: time
      timeframes: [raw, date, week, month, quarter, year]
      convert_tz: no
      datatype: date
      sql: last_modified_date ;;
    }
    dimension: latest_component_path {
      type: string
      sql: latest_component_path ;;
    }
    dimension: manager_name {
      type: string
      sql: manager_name ;;
    }
    dimension: priority {
      type: string
      sql: priority ;;
    }
    dimension: response_slo {
      type: string
      sql: response_slo ;;
    }
    dimension: slo_flg {
      type: string
      sql: slo_flg ;;
    }
    dimension: slo_status {
      type: string
      sql: slo_status ;;
    }
    dimension: status {
      type: string
      sql: status ;;
    }
    dimension: three_pdc_metrics_demo__irpt_active_bugs_detail_data {
      type: string
      hidden: yes
      sql: three_pdc_metrics_demo__irpt_active_bugs_detail_data ;;
    }
    dimension: title {
      type: string
      sql: title ;;
    }
    dimension: total {
      type: number
      sql: total ;;
    }
  }
