view: iowa_liquor_sales {
  sql_table_name: `LIQUOR_SALES_STAGING.iowa_liquor_sales`
    ;;

  dimension: bottle_volume_ml {
    type: number
    sql: ${TABLE}.bottle_volume_ml ;;
  }

  dimension: bottles_sold {
    type: number
    sql: ${TABLE}.bottles_sold ;;
  }

  dimension: category {
    type: string
    sql: ${TABLE}.category ;;
  }

  dimension_group: sales {
    type: time
    timeframes: [time, date, week, month, raw]
    datatype: date
    sql: ${TABLE}.date ;;
  }

  dimension: invoice_and_item_number {
    type: string

    sql: ${TABLE}.invoice_and_item_number ;;
  }

  dimension: item_number {
    type: string
    sql: ${TABLE}.item_number ;;
  }

  dimension: pack {
    type: number
    sql: ${TABLE}.pack ;;
  }

  dimension: sale_dollars {
    type: number
    sql: ${TABLE}.sale_dollars ;;
  }

  measure: total_sales {
    label: "Total Sales"
    type: sum
    value_format_name: usd
    sql: ${sale_dollars} ;;

  }

  measure: total_sales_YTD {
    label: "Total Sales YTD"
    type: running_total
    value_format_name: usd
    sql: ${total_sales} ;;
  }

  dimension: state_bottle_cost {
    type: number
    sql: ${TABLE}.state_bottle_cost ;;
  }

  dimension: state_bottle_retail {
    type: number
    sql: ${TABLE}.state_bottle_retail ;;
  }

  dimension: store_number {
    type: string
    sql: ${TABLE}.store_number ;;
  }

  dimension: vendor_number {
    type: string
    sql: ${TABLE}.vendor_number ;;
  }

  dimension: volume_sold_gallons {
    type: number
    sql: ${TABLE}.volume_sold_gallons ;;
  }

  dimension: volume_sold_liters {
    type: number
    sql: ${TABLE}.volume_sold_liters ;;
  }

}
