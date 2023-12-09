---
- dashboard: 3pdc_business_metrics_dashboard
  title: 3PDC Business Metrics Dashboard
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: VPvvBgSqfeBPgA2FZJPV9E
  elements:
  - title: Summary by Region
    name: Summary by Region
    model: three_pdc_metrics_poc
    explore: three_pdc_metrics_demo
    type: looker_grid
    fields: [three_pdc_metrics_demo.region, three_pdc_metrics_demo.sdd_slo_score_base,
      three_pdc_metrics_demo.ds_rca_slo_score, three_pdc_metrics_demo.mmt1_slo_average_score_base,
      three_pdc_metrics_demo.mmt23_slo_average_score_base, three_pdc_metrics_demo.mmso_slo_average_score,
      three_pdc_metrics_demo.er_slo_score, three_pdc_metrics_demo.irpt_slo_score,
      three_pdc_metrics_demo.bct_slo_score, three_pdc_metrics_demo.botd_slo_score,
      three_pdc_metrics_demo.bm_slo_score]
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
      Performance Metrics: map_mapping_details.data_source
      Duration Type: three_pdc_metrics_demo.param_duration_type
      Duration Date: three_pdc_metrics_demo.p_duration_date
    row: 1
    col: 0
    width: 24
    height: 6
  - title: Summary by Metro
    name: Summary by Metro
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
      Performance Metrics: map_mapping_details.data_source
      Duration Type: three_pdc_metrics_demo.param_duration_type
      Duration Date: three_pdc_metrics_demo.p_duration_date
    row: 7
    col: 0
    width: 24
    height: 6
  - title: Out of SLO Metros
    name: Out of SLO Metros
    model: three_pdc_metrics_poc
    explore: three_pdc_metrics_demo
    type: looker_google_map
    fields: [map_mapping_details.map_details, map_mapping_details.map_metric, map_mapping_details.ooslo_metric_size]
    sorts: [map_mapping_details.ooslo_metric_size desc 0]
    limit: 500
    column_limit: 50
    hidden_fields: [map_mapping_details.map_metric]
    hidden_points_if_no: []
    series_labels: {}
    show_view_names: false
    map_plot_mode: points
    heatmap_gridlines: true
    heatmap_gridlines_empty: false
    heatmap_opacity: 0.5
    show_region_field: true
    draw_map_labels_above_data: true
    map_tile_provider: light
    map_position: custom
    map_zoom: 3
    map_pannable: true
    map_zoomable: true
    map_marker_type: circle
    map_marker_icon_name: default
    map_marker_radius_mode: equal_to_value
    map_marker_units: pixels
    map_marker_proportional_scale_type: linear
    map_marker_color_mode: value
    show_legend: true
    quantize_map_value_colors: false
    reverse_map_value_colors: false
    defaults_version: 0
    listen:
      Region: three_pdc_metrics_demo.region
      Metro: three_pdc_metrics_demo.metro
      Performance Metrics: map_mapping_details.data_source
      Duration Type: three_pdc_metrics_demo.param_duration_type
      Duration Date: three_pdc_metrics_demo.p_duration_date
    row: 13
    col: 0
    width: 24
    height: 6
  - title: New Tile
    name: New Tile
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
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    show_view_names: false
    show_row_numbers: false
    transpose: false
    truncate_text: false
    truncate_header: false
    size_to_fit: false
    minimum_column_width: 75
    table_theme: white
    limit_displayed_rows: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    hide_totals: false
    hide_row_totals: false
    defaults_version: 1
    listen:
      Region: three_pdc_metrics_demo.region
      Metro: three_pdc_metrics_demo.metro
      Duration Date: three_pdc_metrics_demo.p_duration_date
      Duration Type: three_pdc_metrics_demo.param_duration_type
    row: 0
    col: 0
    width: 9
    height: 1
  filters:
  - name: Performance Metrics
    title: Performance Metrics
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
    field: map_mapping_details.data_source
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
