connection: "iowa_liquor_sales"

# include all the views
include: "/views/**/*.view"

datagroup: iowa_liquor_sales_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "12 hour"
}

persist_with: iowa_liquor_sales_default_datagroup

explore: sales {
  group_label: "Iowa Liquor Sales Explores"
  label: "(1) Iowa Liquor Sales"
  view_name: iowa_liquor_sales
  # access_filter: {
  #   field: items.item_description
  #   user_attribute: item_access
  # }
  join: iowa_liquor_stores {
    view_label: "Stores"
    relationship: many_to_one
    sql_on:  ${iowa_liquor_stores.store_number} = ${iowa_liquor_sales.store_number} ;;
  }

  join: iowa_liquor_county {
    view_label: "County"
    relationship: many_to_one
    sql_on: ${iowa_liquor_county.county_number} = ${iowa_liquor_stores.county_number} ;;

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
  join: store_facts {
    view_label: "Store using liquid"
    relationship: many_to_one
    sql_on: ${store_facts.store_number} = ${iowa_liquor_sales.store_number} ;;
  }

}



explore: fannout_test {
  group_label: "Iowa Liquor Sales Explores"
  label: "(2) Fannout Test"
  view_name: orders_test
  join: customer_test {
    view_label: "Customer Test"
    relationship: many_to_one
    sql_on: ${orders_test.customer_id} = ${customer_test.customer_id} ;;
  }
}
