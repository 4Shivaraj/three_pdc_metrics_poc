connection: "@{CONNECTION_NAME}"

# include all the views
include: "/views/refinements/*.view.lkml"
include: "/views/derived/*.view.lkml"
include: "/dashboards/*.dashboard.lookml"

datagroup: three_pdc_metrics_poc_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: three_pdc_metrics_poc_default_datagroup

explore: three_pdc_metrics_demo {
  join: _ds_detail_data {
    sql: LEFT JOIN UNNEST(${three_pdc_metrics_demo.ds_detail_data}) as _ds_detail_data ;;
    relationship: one_to_many
  }
  join: _mm_detail_data {
    sql: LEFT JOIN UNNEST(${three_pdc_metrics_demo.mm_detail_data}) as _mm_detail_data ;;
    relationship: one_to_many
  }
  join: _mm_summary_data {
    sql: LEFT JOIN UNNEST(${three_pdc_metrics_demo.mm_summary_data}) as _mm_summary_data
    on ${_mm_detail_data.metro_tier} = ${_mm_summary_data.metro_tier};;
    relationship: one_to_many
  }
  join: _mm_svops_detail_data {
    sql: LEFT JOIN UNNEST(${three_pdc_metrics_demo.mm_svops_detail_data}) as _mm_svops_detail_data
    on ${_mm_summary_data.metro_tier} = ${_mm_svops_detail_data.metro_tier} ;;
    relationship: one_to_many
  }
  join: _mm_svops_summary_data {
    sql: LEFT JOIN UNNEST(${three_pdc_metrics_demo.mm_svops_summary_data}) as _mm_svops_summary_data
    on ${_mm_svops_detail_data.metro_tier} = ${_mm_svops_summary_data.metro_tier} ;;
    relationship: one_to_many
  }
  join: _er_detail_data{
    sql: LEFT JOIN UNNEST(${three_pdc_metrics_demo.er_detail_data}) as _er_detail_data ;;
    relationship: one_to_many
  }
  join: _irpt_active_bugs_detail_data {
    sql: LEFT JOIN UNNEST(${three_pdc_metrics_demo.irpt_active_bugs_detail_data}) as _irpt_active_bugs_detail_data ;;
    relationship: one_to_many
  }
  join: _irpt_summary_data {
    sql: LEFT JOIN UNNEST(${three_pdc_metrics_demo.irpt_summary_data}) as _irpt_summary_data ;;
    relationship: one_to_many
  }
  join: _bct_detail_summary_data {
    sql: LEFT JOIN UNNEST(${three_pdc_metrics_demo.bct_detail_summary_data}) as _bct_detail_summary_data ;;
    relationship: one_to_many
  }
  join: _botd_detail_summary_data {
    sql: LEFT JOIN UNNEST(${three_pdc_metrics_demo.botd_detail_summary_data}) as _botd_detail_summary_data ;;
    relationship: one_to_many
  }
  join: _bm_active_bugs_detail_data {
    sql: LEFT JOIN UNNEST(${three_pdc_metrics_demo.bm_active_bugs_detail_data}) as _bm_active_bugs_detail_data ;;
    relationship: one_to_many
  }
  join: _ds_rca_detail_data {
    sql: LEFT JOIN UNNEST(${three_pdc_metrics_demo.ds_rca_detail_data}) as _ds_rca_detail_data ;;
    relationship: one_to_many
  }
  join: map_mapping_details{
    type: left_outer
    relationship: one_to_many
    sql_on: ${three_pdc_metrics_demo.region} = ${map_mapping_details.region}
    and ${three_pdc_metrics_demo.metro} = ${map_mapping_details.metro} ;;
  }
}

explore: map_mapping_details {}
