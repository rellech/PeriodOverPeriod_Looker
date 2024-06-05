view: orders_test {
  sql_table_name: `marcos-tests.LIQUOR_SALES_STAGING.orders_test`
    ;;

  dimension: amount {
    type: number
    sql: ${TABLE}.amount ;;
  }

  dimension: customer_id {
    type: number
    sql: ${TABLE}.customer_id ;;
  }

  dimension: order_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.order_id ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  measure: total_amount {
    label: "Total Amount"
    type: sum
    value_format_name: usd
    sql: ${amount} ;;
  }
  set: detail {
    fields: [customer_id, order_id, amount]
  }
}
