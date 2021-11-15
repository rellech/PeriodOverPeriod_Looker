view: items {
  sql_table_name: `LIQUOR_SALES_STAGING.items`
    ;;

  dimension: item_description {
    type: string
    sql: ${TABLE}.item_description ;;
  }

  dimension: item_number {
    type: string
    sql: ${TABLE}.item_number ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
