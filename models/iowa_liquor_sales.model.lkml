connection: "iowa_liquor_sales"

# include all the views
include: "/views/**/*.view"

datagroup: iowa_liquor_sales_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "12 hour"
}

persist_with: iowa_liquor_sales_default_datagroup

explore: sales {
  label: "(1) Iowa Liquor Sales"
  view_name: iowa_liquor_sales
  join: iowa_liquor_stores {
    view_label: "Stores"
    relationship: many_to_one
    sql_on:  ${iowa_liquor_stores.store_number} = ${iowa_liquor_sales.store_number} ;;
  }

  join: iowa_liquor_county {
    view_label: "County"
    relationship: many_to_one
    sql_on: ${iowa_liquor_county.county_number ) = ${iowa_liquor_stores.county_number}} ;;

  }

  join: iowa_liquor_vendors {
    view_label: "Vendors"
    relationship: many_to_one
    sql_on: ${iowa_liquor_vendors.vendor_number} = ${iowa_liquor_sales.vendor_number} ;;
  }

  join: iowa_liquor_category {
    view_label: "Category"
    relationship: many_to_one
    sql_on: ${iowa_liquor_category.category} = ${iowa_liquor_sales.category} ;;
  }
  join: items {
    view_label: "Items"
    relationship: many_to_one
    sql_on: ${items.item_number} = ${iowa_liquor_sales.item_number} ;;
  }

}
