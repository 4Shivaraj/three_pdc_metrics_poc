---
- dashboard: 3pdc_data_security_rca
  title: 3PDC Data Security RCA
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: HNweAoUVx8l03UWQwoLgyD
  elements:
  - title: Metric Summary
    name: Metric Summary
    model: three_pdc_metrics_poc
    explore: three_pdc_metrics_demo
    type: looker_grid
    fields: [three_pdc_metrics_demo.region, three_pdc_metrics_demo.sdd_slo_score_base,
      three_pdc_metrics_demo.ds_rca_slo_score, three_pdc_metrics_demo.mmt1_slo_average_score_base,
      three_pdc_metrics_demo.mmt23_slo_average_score_base, three_pdc_metrics_demo.mmso_slo_average_score,
      three_pdc_metrics_demo.er_slo_score, three_pdc_metrics_demo.irpt_slo_score,
      three_pdc_metrics_demo.bct_slo_score, three_pdc_metrics_demo.botd_slo_score,
      three_pdc_metrics_demo.bm_slo_score, three_pdc_metrics_demo.metro]
    sorts: [three_pdc_metrics_demo.sdd_slo_score_base desc]
    limit: 500
    column_limit: 50
    show_view_names: false
    show_row_numbers: false
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: gray
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    truncate_header: false
    minimum_column_width: 74
    series_cell_visualizations:
      three_pdc_metrics_demo.sdd_slo_score_base:
        is_active: false
    hidden_pivots: {}
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    listen:
      Region: three_pdc_metrics_demo.region
      Metro: three_pdc_metrics_demo.metro
      Duration Type: three_pdc_metrics_demo.param_duration_type
      Duration Date: three_pdc_metrics_demo.p_duration_date
    row: 1
    col: 0
    width: 24
    height: 6
  - name: Data Security Details
    type: text
    title_text: Data Security Details
    subtitle_text: ''
    body_text: ''
    row: 7
    col: 0
    width: 24
    height: 1
  - title: SLO Score
    name: SLO Score
    model: three_pdc_metrics_poc
    explore: three_pdc_metrics_demo
    type: looker_grid
    fields: [three_pdc_metrics_demo.region, three_pdc_metrics_demo.ds_rca_target,
      three_pdc_metrics_demo.ds_rca_slo_score, three_pdc_metrics_demo.om_verified_score]
    filters: {}
    sorts: [three_pdc_metrics_demo.region]
    limit: 500
    column_limit: 50
    show_view_names: false
    show_row_numbers: false
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: gray
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    truncate_header: false
    minimum_column_width: 75
    series_labels:
      three_pdc_metrics_demo.sdd_slo_score_base: SLO Score
      three_pdc_metrics_demo.ds_rca_slo_score: SLO Score
    series_cell_visualizations:
      three_pdc_metrics_demo.sdd_slo_score_base:
        is_active: false
    defaults_version: 1
    listen:
      Region: three_pdc_metrics_demo.region
      Metro: three_pdc_metrics_demo.metro
      Duration Date: three_pdc_metrics_demo.p_duration_date
      Duration Type: three_pdc_metrics_demo.param_duration_type
    row: 8
    col: 13
    width: 11
    height: 6
  - title: Untitled
    name: Untitled
    model: three_pdc_metrics_poc
    explore: three_pdc_metrics_demo
    type: single_value
    fields: [three_pdc_metrics_demo.last_data_refreshed]
    sorts: [three_pdc_metrics_demo.last_data_refreshed]
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: false
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    listen:
      Region: three_pdc_metrics_demo.region
      Metro: three_pdc_metrics_demo.metro
      Duration Date: three_pdc_metrics_demo.p_duration_date
      Duration Type: three_pdc_metrics_demo.param_duration_type
    row: 0
    col: 0
    width: 8
    height: 1
  - title: Slip Details
    name: Slip Details
    model: three_pdc_metrics_poc
    explore: three_pdc_metrics_demo
    type: looker_grid
    fields: [three_pdc_metrics_demo.region, three_pdc_metrics_demo.metro, _ds_rca_detail_data.campus,
      _ds_rca_detail_data.location_type, _ds_rca_detail_data.violation_type, _ds_rca_detail_data.bug_id,
      _ds_rca_detail_data.slip_root_cause, three_pdc_metrics_demo.calendar_date, _ds_rca_detail_data.rca_duration_days,
      _ds_rca_detail_data.verified_by_om_days]
    filters: {}
    sorts: [three_pdc_metrics_demo.region]
    limit: 500
    column_limit: 50
    show_view_names: false
    show_row_numbers: false
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: gray
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    truncate_header: false
    minimum_column_width: 75
    defaults_version: 1
    listen:
      Region: three_pdc_metrics_demo.region
      Metro: three_pdc_metrics_demo.metro
      Duration Date: three_pdc_metrics_demo.p_duration_date
      Duration Type: three_pdc_metrics_demo.param_duration_type
    row: 14
    col: 0
    width: 24
    height: 6
  - title: Trend View
    name: Trend View
    model: three_pdc_metrics_poc
    explore: three_pdc_metrics_demo
    type: looker_column
    fields: [three_pdc_metrics_demo.region, three_pdc_metrics_demo.p_duration_date,
      three_pdc_metrics_demo.ds_rca_slo_score, three_pdc_metrics_demo.ds_rca_target]
    filters: {}
    sorts: [three_pdc_metrics_demo.ds_rca_slo_score desc 0]
    limit: 500
    column_limit: 50
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: true
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: normal
    limit_displayed_rows: false
    legend_position: right
    point_style: circle
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    y_axes: [{label: '', orientation: left, series: [{axisId: three_pdc_metrics_demo.ds_rca_target,
            id: three_pdc_metrics_demo.ds_rca_target, name: Target}, {axisId: three_pdc_metrics_demo.ds_rca_slo_score,
            id: three_pdc_metrics_demo.ds_rca_slo_score, name: 'Data Security RCA
              (Target: 100%)'}], showLabels: true, showValues: true, unpinAxis: false,
        tickDensity: default, type: linear}]
    x_axis_zoom: true
    y_axis_zoom: false
    limit_displayed_rows_values:
      show_hide: hide
      first_last: first
      num_rows: 0
    hide_legend: false
    series_types:
      three_pdc_metrics_demo.ds_rca_target: scatter
    series_colors:
      three_pdc_metrics_demo.ds_target: "#EA4335"
      three_pdc_metrics_demo.ds_rca_target: "#EA4335"
    series_labels:
      three_pdc_metrics_demo.sdd_slo_score_base: SLO Score
      three_pdc_metrics_demo.ds_rca_slo_score: SLO Score
    series_point_styles:
      three_pdc_metrics_demo.ds_rca_target: auto
    defaults_version: 1
    hidden_pivots: {}
    listen:
      Region: three_pdc_metrics_demo.region
      Metro: three_pdc_metrics_demo.metro
      Duration Date: three_pdc_metrics_demo.p_duration_date
      Duration Type: three_pdc_metrics_demo.param_duration_type
    row: 8
    col: 0
    width: 13
    height: 6
  filters:
  - name: Region
    title: Region
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
    model: three_pdc_metrics_poc
    explore: three_pdc_metrics_demo
    listens_to_filters: []
    field: three_pdc_metrics_demo.region
  - name: Metro
    title: Metro
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
    model: three_pdc_metrics_poc
    explore: three_pdc_metrics_demo
    listens_to_filters: []
    field: three_pdc_metrics_demo.metro
  - name: Duration Type
    title: Duration Type
    type: field_filter
    default_value: Year
    allow_multiple_values: true
    required: false
    ui_config:
      type: dropdown_menu
      display: inline
    model: three_pdc_metrics_poc
    explore: three_pdc_metrics_demo
    listens_to_filters: []
    field: three_pdc_metrics_demo.param_duration_type
  - name: Duration Date
    title: Duration Date
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
      options: []
    model: three_pdc_metrics_poc
    explore: three_pdc_metrics_demo
    listens_to_filters: [Duration Type]
    field: three_pdc_metrics_demo.p_duration_date
