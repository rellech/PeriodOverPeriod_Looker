view: iowa_liquor_category {
  sql_table_name: `LIQUOR_SALES_STAGING.iowa_liquor_category`
    ;;

  dimension: category {
    type: string
    sql: ${TABLE}.category ;;
  }

  dimension: category_name {
    type: string
    sql: ${TABLE}.category_name ;;
  }

}
