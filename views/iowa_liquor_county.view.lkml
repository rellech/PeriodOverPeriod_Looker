view: iowa_liquor_county {
  sql_table_name: `LIQUOR_SALES_STAGING.iowa_liquor_county`
    ;;

  dimension: county {
    type: string
    sql: ${TABLE}.county ;;
  }

  dimension: county_number {
    type: string
    sql: ${TABLE}.county_number ;;
  }

}
