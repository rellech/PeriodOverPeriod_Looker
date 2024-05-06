include: "/3_logical/sales_periods_base.explore.lkml"


explore: sales_mkt_ext {
  extension: required
  extends: [sales_periods_base]
  view_name: sales_periods_base
  always_filter: {filters: [sales_periods_base.zip_code: "0101"]}
}
