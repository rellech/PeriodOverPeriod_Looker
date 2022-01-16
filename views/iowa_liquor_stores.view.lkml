view: iowa_liquor_stores {
  sql_table_name: `LIQUOR_SALES_STAGING.iowa_liquor_stores`
    ;;

  dimension: address {
    group_label: "Geography"
    type: string
    sql: ${TABLE}.address ;;
  }

  dimension: city {
    group_label: "Geography"
    type: string
    sql: ${TABLE}.city ;;
  }

  dimension: county_number {
    type: string
    sql: ${TABLE}.county_number ;;
  }

  dimension: store_location {
    group_label: "Geography"
    type: string
    sql: ${TABLE}.store_location ;;
  }

  dimension: store_name {
    type: string
    sql: ${TABLE}.store_name ;;
  }

  dimension: store_number {
    type: string
    sql: ${TABLE}.store_number ;;
  }

  dimension: zip_code {
    group_label: "Geography"
    type: zipcode
    sql: ${TABLE}.zip_code ;;
  }

  measure: count {
    label: "Number of Stores"
    type: count
    drill_fields: [store_name]
  }
}
