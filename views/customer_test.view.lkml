view: customer_test {
    sql_table_name: `marcos-tests.LIQUOR_SALES_STAGING.customer_test`
      ;;

  dimension: customer_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.customer_id ;;
  }

  dimension: first_name {
    type: string
    sql: ${TABLE}.first_name ;;
  }

  dimension: last_name {
    type: string
    sql: ${TABLE}.last_name ;;
  }

  dimension: visits {
    type: number
    sql: ${TABLE}.visits ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  measure: total_visits {
    label: "Total Visits"
    type: sum
    sql: ${visits} ;;
  }

  set: detail {
    fields: [customer_id, first_name, last_name, visits]
  }
}
