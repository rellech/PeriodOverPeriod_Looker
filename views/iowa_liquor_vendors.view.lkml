view: iowa_liquor_vendors {
  sql_table_name: `LIQUOR_SALES_STAGING.iowa_liquor_vendors`
    ;;

  dimension: vendor_name {
    type: string
    sql: ${TABLE}.vendor_name ;;
  }

  dimension: vendor_number {
    type: string
    sql: ${TABLE}.vendor_number ;;
  }

  measure: count {
    type: count
    drill_fields: [vendor_name]
  }
}
