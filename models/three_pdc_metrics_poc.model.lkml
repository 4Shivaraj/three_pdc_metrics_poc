connection: "@{CONNECTION_NAME}"

# include all the views
include: "/views/**/*.view.lkml"

datagroup: three_pdc_metrics_poc_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: three_pdc_metrics_poc_default_datagroup

explore: three_pdc_metrics_demo {
    join: three_pdc_metrics_demo__ds_detail_data {
      view_label: "Three Pdc Metrics Demo: Ds Detail Data"
      sql: LEFT JOIN UNNEST(${three_pdc_metrics_demo.ds_detail_data}) as three_pdc_metrics_demo__ds_detail_data ;;
      relationship: one_to_many
    }
    join: three_pdc_metrics_demo__er_detail_data {
      view_label: "Three Pdc Metrics Demo: Er Detail Data"
      sql: LEFT JOIN UNNEST(${three_pdc_metrics_demo.er_detail_data}) as three_pdc_metrics_demo__er_detail_data ;;
      relationship: one_to_many
    }
    join: three_pdc_metrics_demo__mm_detail_data {
      view_label: "Three Pdc Metrics Demo: Mm Detail Data"
      sql: LEFT JOIN UNNEST(${three_pdc_metrics_demo.mm_detail_data}) as three_pdc_metrics_demo__mm_detail_data ;;
      relationship: one_to_many
    }
    join: three_pdc_metrics_demo__mm_summary_data {
      view_label: "Three Pdc Metrics Demo: Mm Summary Data"
      sql: LEFT JOIN UNNEST(${three_pdc_metrics_demo.mm_summary_data}) as three_pdc_metrics_demo__mm_summary_data ;;
      relationship: one_to_many
    }
    join: three_pdc_metrics_demo__irpt_summary_data {
      view_label: "Three Pdc Metrics Demo: Irpt Summary Data"
      sql: LEFT JOIN UNNEST(${three_pdc_metrics_demo.irpt_summary_data}) as three_pdc_metrics_demo__irpt_summary_data ;;
      relationship: one_to_many
    }
    join: three_pdc_metrics_demo__ds_rca_detail_data {
      view_label: "Three Pdc Metrics Demo: Ds Rca Detail Data"
      sql: LEFT JOIN UNNEST(${three_pdc_metrics_demo.ds_rca_detail_data}) as three_pdc_metrics_demo__ds_rca_detail_data ;;
      relationship: one_to_many
    }
    join: three_pdc_metrics_demo__mm_svops_detail_data {
      view_label: "Three Pdc Metrics Demo: Mm Svops Detail Data"
      sql: LEFT JOIN UNNEST(${three_pdc_metrics_demo.mm_svops_detail_data}) as three_pdc_metrics_demo__mm_svops_detail_data ;;
      relationship: one_to_many
    }
    join: three_pdc_metrics_demo__mm_svops_summary_data {
      view_label: "Three Pdc Metrics Demo: Mm Svops Summary Data"
      sql: LEFT JOIN UNNEST(${three_pdc_metrics_demo.mm_svops_summary_data}) as three_pdc_metrics_demo__mm_svops_summary_data ;;
      relationship: one_to_many
    }
    join: three_pdc_metrics_demo__bct_detail_summary_data {
      view_label: "Three Pdc Metrics Demo: Bct Detail Summary Data"
      sql: LEFT JOIN UNNEST(${three_pdc_metrics_demo.bct_detail_summary_data}) as three_pdc_metrics_demo__bct_detail_summary_data ;;
      relationship: one_to_many
    }
    join: three_pdc_metrics_demo__botd_detail_summary_data {
      view_label: "Three Pdc Metrics Demo: Botd Detail Summary Data"
      sql: LEFT JOIN UNNEST(${three_pdc_metrics_demo.botd_detail_summary_data}) as three_pdc_metrics_demo__botd_detail_summary_data ;;
      relationship: one_to_many
    }
    join: three_pdc_metrics_demo__bm_active_bugs_detail_data {
      view_label: "Three Pdc Metrics Demo: Bm Active Bugs Detail Data"
      sql: LEFT JOIN UNNEST(${three_pdc_metrics_demo.bm_active_bugs_detail_data}) as three_pdc_metrics_demo__bm_active_bugs_detail_data ;;
      relationship: one_to_many
    }
    join: three_pdc_metrics_demo__irpt_active_bugs_detail_data {
      view_label: "Three Pdc Metrics Demo: Irpt Active Bugs Detail Data"
      sql: LEFT JOIN UNNEST(${three_pdc_metrics_demo.irpt_active_bugs_detail_data}) as three_pdc_metrics_demo__irpt_active_bugs_detail_data ;;
      relationship: one_to_many
    }
}
