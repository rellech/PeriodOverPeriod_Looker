view: store_facts {
  derived_table: {
    sql: SELECT
          sum(iowa_liquor_sales.sale_dollars * 1.21) AS sale_dollars,
          iowa_liquor_sales.store_number  AS store_number
      FROM `LIQUOR_SALES_STAGING.iowa_liquor_sales`
           AS iowa_liquor_sales
      WHERE {% condition select_date %}
      SAFE_CAST(iowa_liquor_sales.date as TIMESTAMP)
      {% endcondition %}
      GROUP BY
          store_number
       ;;
  }
  filter: select_date {
    type: date
    suggest_explore: iowa_liquor_sales
    suggest_dimension: iowa_liquor_sales.sales_date
  }

  measure: count {
    type: count
    hidden: yes
    drill_fields: [detail*]
  }

  dimension: sale_dollars {
    type: number
    sql: ${TABLE}.sale_dollars ;;
  }

  dimension: store_number {
    primary_key: yes
    type: string
    sql: ${TABLE}.store_number ;;
  }

  measure: total_sales {
    type: sum
    value_format_name: usd
    sql: ${sale_dollars} ;;
  }

  set: detail {
    fields: [sale_dollars, store_number]
  }
}
