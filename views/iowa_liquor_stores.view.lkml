view: iowa_liquor_stores {
  sql_table_name: `LIQUOR_SALES_STAGING.iowa_liquor_stores`
    ;;

  dimension: address {
    group_label: "Geography"
    type: string
    sql: ${TABLE}.address ;;
    drill_fields: [hierarchy_detail*]
  }

  dimension: city {
    group_label: "Geography"
    type: string
    sql: ${TABLE}.city ;;
    drill_fields: [hierarchy_detail*]
  }

  dimension: county_number {
    type: string
    sql: ${TABLE}.county_number ;;
    drill_fields: [hierarchy_detail*]
  }

  dimension: store_location {
    group_label: "Geography"
    label: "store"
    type: string
    sql: ${TABLE}.store_location ;;
    drill_fields: [hierarchy_detail*]
  }

  dimension: store_name {
    type: string
    sql: ${TABLE}.store_name ;;
    drill_fields: [hierarchy_detail*]
  }

  dimension: store_number {
    type: string
    sql: ${TABLE}.store_number ;;
  }

  dimension: zip_code {
    group_label: "Geography"
    type: zipcode
    sql: ${TABLE}.zip_code ;;
    drill_fields: [hierarchy_detail*]
  }

  measure: count {
    label: "Number of Stores"
    type: count
    drill_fields: [store_name]
  }

  set: hierarchy_detail {
    fields: [iowa_liquor_stores.city,iowa_liquor_stores.store_name, iowa_liquor_category.category, items.item_description ]
  }

}
