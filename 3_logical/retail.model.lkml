connection: "con_rell"

include: "/3_logical/sales_periods_base.explore.lkml"
include: "/3_logical/sales_periods_mkt_ext.explore.lkml"
include: "/3_logical/sales_periods_finance_ext.explore.lkml"
# include: "/3_logical/sales_mkt.explore.lkml"
# include: "/2_standard/period_over_period.view.lkml"
# include all views in the views/ folder in this project
# include: "/**/*.view.lkml"                 # include all views in this project
# include: "my_dashboard.dashboard.lookml"   # include a LookML dashboard called my_dashboard


explore: sales_base {
  extends: [sales_periods_base]
}

explore: sales_mkt {
  extends: [sales_mkt_ext]
}

explore: sales_finance {
  extends: [sales_finance_ext]
}
