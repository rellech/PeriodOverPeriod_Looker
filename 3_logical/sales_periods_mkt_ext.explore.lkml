include: "/3_logical/sales_periods_base.explore.lkml"


explore: sales_mkt_ext {
  extension: required
  extends: [sales_periods_base]
  view_name: sales_periods_base
  conditionally_filter: {filters: [period_over_period.period_defined_filter: "YoY"]
    unless:[sales_periods_base.date_range_filter]}
}
