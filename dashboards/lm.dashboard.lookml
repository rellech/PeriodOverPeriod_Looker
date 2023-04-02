- dashboard: iowa_liquor_sales
  title: Iowa Liquor Sales
  layout: newspaper
  preferred_viewer: dashboards-next
  crossfilter_enabled: true
  description: ''
  filters_bar_collapsed: true
  preferred_slug: 3RQHL5RrQN5FLgVEBisFDb
  elements:
  - title: Total Sales
    name: Total Sales
    model: iowa_liquor_sales
    explore: sales
    type: single_value
    fields: [iowa_liquor_sales.total_sales]
    limit: 500
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    listen:
      County: iowa_liquor_county.county
      Store: iowa_liquor_stores.store_name
      City: iowa_liquor_stores.city
      Vendor: iowa_liquor_vendors.vendor_name
      Date: iowa_liquor_sales.sales_date
      Item Description: items.item_description
    row: 0
    col: 0
    width: 7
    height: 3
  - title: Total Cost
    name: Total Cost
    model: iowa_liquor_sales
    explore: sales
    type: single_value
    fields: [iowa_liquor_sales.total_cost]
    filters:
      iowa_liquor_sales.sales_month: '2021'
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    listen:
      County: iowa_liquor_county.county
      Store: iowa_liquor_stores.store_name
      City: iowa_liquor_stores.city
      Vendor: iowa_liquor_vendors.vendor_name
      Date: iowa_liquor_sales.sales_date
      Item Description: items.item_description
    row: 0
    col: 7
    width: 6
    height: 3
  - title: Benefit
    name: Benefit
    model: iowa_liquor_sales
    explore: sales
    type: single_value
    fields: [iowa_liquor_sales.total_benefit]
    filters:
      iowa_liquor_sales.sales_month: '2021'
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    conditional_formatting: [{type: greater than, value: 0, background_color: '',
        font_color: "#7CB342", color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2,
          palette_id: 56d0c358-10a0-4fd6-aa0b-b117bef527ab}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}, {type: less than, value: 0, background_color: '',
        font_color: "#EA4335", color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2,
          palette_id: 56d0c358-10a0-4fd6-aa0b-b117bef527ab}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}]
    defaults_version: 1
    listen:
      County: iowa_liquor_county.county
      Store: iowa_liquor_stores.store_name
      City: iowa_liquor_stores.city
      Vendor: iowa_liquor_vendors.vendor_name
      Date: iowa_liquor_sales.sales_date
      Item Description: items.item_description
    row: 0
    col: 17
    width: 7
    height: 3
  - title: Margin
    name: Margin
    model: iowa_liquor_sales
    explore: sales
    type: single_value
    fields: [iowa_liquor_sales.total_margin]
    filters:
      iowa_liquor_sales.sales_month: '2021'
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    conditional_formatting: [{type: greater than, value: 0, background_color: '',
        font_color: "#7CB342", color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2,
          palette_id: 56d0c358-10a0-4fd6-aa0b-b117bef527ab}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}, {type: less than, value: 0, background_color: '',
        font_color: "#EA4335", color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2,
          palette_id: 56d0c358-10a0-4fd6-aa0b-b117bef527ab}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}]
    defaults_version: 1
    listen:
      County: iowa_liquor_county.county
      Store: iowa_liquor_stores.store_name
      City: iowa_liquor_stores.city
      Vendor: iowa_liquor_vendors.vendor_name
      Date: iowa_liquor_sales.sales_date
      Item Description: items.item_description
    row: 0
    col: 13
    width: 4
    height: 3
  - title: Sales by Month
    name: Sales by Month
    model: iowa_liquor_sales
    explore: sales
    type: looker_line
    fields: [iowa_liquor_sales.total_sales, iowa_liquor_sales.sales_month, iowa_liquor_county.county]
    pivots: [iowa_liquor_county.county]
    fill_fields: [iowa_liquor_sales.sales_month]
    sorts: [iowa_liquor_sales.total_sales desc 0, iowa_liquor_sales.sales_month, iowa_liquor_county.county]
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
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    conditional_formatting: [{type: greater than, value: 0, background_color: '',
        font_color: "#7CB342", color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2,
          palette_id: 56d0c358-10a0-4fd6-aa0b-b117bef527ab}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}, {type: less than, value: 0, background_color: '',
        font_color: "#EA4335", color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2,
          palette_id: 56d0c358-10a0-4fd6-aa0b-b117bef527ab}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}]
    defaults_version: 1
    series_types: {}
    listen:
      County: iowa_liquor_county.county
      Store: iowa_liquor_stores.store_name
      City: iowa_liquor_stores.city
      Vendor: iowa_liquor_vendors.vendor_name
      Date: iowa_liquor_sales.sales_date
      Item Description: items.item_description
    row: 3
    col: 0
    width: 14
    height: 6
  - title: Sales by County
    name: Sales by County
    model: iowa_liquor_sales
    explore: sales
    type: looker_pie
    fields: [iowa_liquor_sales.total_sales, iowa_liquor_county.county]
    sorts: [iowa_liquor_sales.total_sales desc]
    limit: 10
    column_limit: 50
    value_labels: legend
    label_type: labPer
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
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    conditional_formatting: [{type: greater than, value: 0, background_color: '',
        font_color: "#7CB342", color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2,
          palette_id: 56d0c358-10a0-4fd6-aa0b-b117bef527ab}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}, {type: less than, value: 0, background_color: '',
        font_color: "#EA4335", color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2,
          palette_id: 56d0c358-10a0-4fd6-aa0b-b117bef527ab}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}]
    defaults_version: 1
    series_types: {}
    listen:
      County: iowa_liquor_county.county
      Store: iowa_liquor_stores.store_name
      City: iowa_liquor_stores.city
      Vendor: iowa_liquor_vendors.vendor_name
      Date: iowa_liquor_sales.sales_date
      Item Description: items.item_description
    row: 3
    col: 14
    width: 10
    height: 6
  - title: Sales by Month Forecasting
    name: Sales by Month Forecasting
    model: iowa_liquor_sales
    explore: sales
    type: looker_line
    fields: [iowa_liquor_sales.total_sales, iowa_liquor_sales.sales_month]
    fill_fields: [iowa_liquor_sales.sales_month]
    sorts: [iowa_liquor_sales.sales_month desc]
    limit: 500
    analysis_config:
      forecasting:
      - confidence_interval: 0.9
        field_name: iowa_liquor_sales.total_sales
        forecast_n: 2
        forecast_interval: month
        seasonality:
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
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    series_types: {}
    groupBars: true
    labelSize: 10pt
    showLegend: true
    defaults_version: 1
    listen:
      Date: iowa_liquor_sales.sales_date
      Item Description: items.item_description
    row: 9
    col: 0
    width: 16
    height: 4
  - title: Stores Benefit Rank
    name: Stores Benefit Rank
    model: iowa_liquor_sales
    explore: sales
    type: looker_bar
    fields: [iowa_liquor_stores.store_name, iowa_liquor_sales.total_benefit]
    sorts: [iowa_liquor_sales.total_benefit desc]
    limit: 15
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
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
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
    series_types: {}
    defaults_version: 1
    listen:
      Item Description: items.item_description
    row: 9
    col: 16
    width: 8
    height: 14
  - title: Stores Sales
    name: Stores Sales
    model: iowa_liquor_sales
    explore: sales
    type: looker_grid
    fields: [iowa_liquor_stores.store_name, iowa_liquor_sales.sales_month, iowa_liquor_sales.total_sales,
      iowa_liquor_sales.total_cost, iowa_liquor_sales.total_benefit, iowa_liquor_sales.total_margin]
    sorts: [iowa_liquor_sales.sales_month desc]
    total: true
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    series_types: {}
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
      Item Description: items.item_description
    row: 13
    col: 0
    width: 16
    height: 10
  - title: New Tile
    name: New Tile
    model: iowa_liquor_sales
    explore: sales
    type: looker_pie
    fields: [iowa_liquor_sales.total_sales, iowa_liquor_stores.store_name]
    filters:
      iowa_liquor_county.county: ''
      iowa_liquor_stores.store_name: ''
      iowa_liquor_stores.city: ''
      iowa_liquor_vendors.vendor_name: ''
      iowa_liquor_sales.sales_date: 2021/01/01 to 2022/01/01
      items.item_description: ''
    sorts: [iowa_liquor_sales.total_sales]
    limit: 10
    dynamic_fields: [{args: [iowa_liquor_sales.total_sales], calculation_type: percent_of_column_sum,
        category: table_calculation, based_on: iowa_liquor_sales.total_sales, label: Percent
          of Iowa Liquor Sales Total Sales, source_field: iowa_liquor_sales.total_sales,
        table_calculation: percent_of_iowa_liquor_sales_total_sales, value_format: !!null '',
        value_format_name: percent_0, _kind_hint: measure, _type_hint: number, is_disabled: true}]
    value_labels: legend
    label_type: labPer
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    series_types: {}
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    hidden_fields:
    listen: {}
    row:
    col:
    width:
    height:
  filters:
  - name: Date
    title: Date
    type: field_filter
    default_value: 2021/01/01 to 2022/01/01
    allow_multiple_values: true
    required: false
    ui_config:
      type: relative_timeframes
      display: inline
      options: []
    model: iowa_liquor_sales
    explore: sales
    listens_to_filters: []
    field: iowa_liquor_sales.sales_date
  - name: County
    title: County
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
      options: []
    model: iowa_liquor_sales
    explore: sales
    listens_to_filters: []
    field: iowa_liquor_county.county
  - name: Store
    title: Store
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
      options: []
    model: iowa_liquor_sales
    explore: sales
    listens_to_filters: []
    field: iowa_liquor_stores.store_name
  - name: City
    title: City
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
      options: []
    model: iowa_liquor_sales
    explore: sales
    listens_to_filters: []
    field: iowa_liquor_stores.city
  - name: Vendor
    title: Vendor
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
      options: []
    model: iowa_liquor_sales
    explore: sales
    listens_to_filters: []
    field: iowa_liquor_vendors.vendor_name
  - name: Item Description
    title: Item Description
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
      options: []
    model: iowa_liquor_sales
    explore: sales
    listens_to_filters: []
    field: items.item_description
