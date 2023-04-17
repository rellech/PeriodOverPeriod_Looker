view: iowa_liquor_county {
  sql_table_name: `LIQUOR_SALES_STAGING.iowa_liquor_county`
    ;;

  dimension: county {
    type: string
    sql: ${TABLE}.county ;;
    drill_fields: [hierarchy_detail*]
  }

  dimension: county_number {
    type: string
    sql: ${TABLE}.county_number ;;
  }


set: hierarchy_detail {
  fields: [iowa_liquor_stores.city, iowa_liquor_stores.address,iowa_liquor_stores.store_name ]
}

}
