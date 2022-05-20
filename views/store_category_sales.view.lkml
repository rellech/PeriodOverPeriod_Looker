view: store_category_sales {
  derived_table: {
    explore_source: sales {
      column: total_sales { field: iowa_liquor_sales.total_sales }
      column: category { field: iowa_liquor_category.category }
      column: store_name { field: iowa_liquor_stores.store_name }
    }
  }
  dimension: total_sales {
    value_format: "$#,##0.00"
    type: number
  }
  dimension: category {
    label: "Category Category"
  }
  dimension: store_name {
    label: "Stores Store Name"
  }
  measure: sales_by_store_category {
    type: sum
    value_format_name: usd
    sql: ${total_sales} ;;
  }
}
