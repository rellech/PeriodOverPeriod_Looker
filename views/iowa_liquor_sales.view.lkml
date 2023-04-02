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
    timeframes: [time, date, week, month, month_num,quarter, year, raw]
    datatype: date
    sql: ${TABLE}.date ;;
  }

  dimension: invoice_and_item_number {
    primary_key: yes
    type: string

    sql: ${TABLE}.invoice_and_item_number ;;

    action: {
      label: "Send this to slack channel"
      url: "https://hooks.zapier.com/hooks/catch/1662138/tvc3zj/"

      param: {
        name: "user_dash_link"
        value: "https://demo.looker.com/dashboards/160?Email={{ users.email._value}}"
      }

      form_param: {
        name: "Message"
        type: textarea
        default: "Hey,
        Could you check out invoice #{{value}},
        customer is reaching out to us about it."
      }

      form_param: {
        name: "Recipient"
        type: select
        default: "zevl"
        option: {
          name: "zevl"
          label: "Zev"
        }
        option: {
          name: "slackdemo"
          label: "Slack Demo User"
        }

      }

      form_param: {
        name: "Channel"
        type: select
        default: "cs"
        option: {
          name: "cs"
          label: "Customer Support"
        }
        option: {
          name: "general"
          label: "General"
        }

      }


    }
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
    sql: ${TABLE}.sale_dollars * 1.83;;
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
######### MEASURES #########

  measure: total_sales {
    label: "Total Sales"
    type: sum
    value_format_name: usd
    sql: ${sale_dollars} ;;
    drill_fields: [detail*]

  }

  measure: total_cost {
    label: "Total Cost"
    type: sum
    value_format_name: usd
    sql: ${bottles_sold} * ${state_bottle_cost};;
  }

  measure: total_margin {
    label: "Margin"
    type: number
    value_format: "0.00%"
    sql: SAFE_DIVIDE(${total_sales},${total_cost}) - 1 ;;
  }

  measure: total_bottles {
    label: "Total Bottles"
    type: sum
    value_format: "0"
    sql: ${bottles_sold} ;;
  }

  measure: total_benefit {
    label: "Benefit"
    type: number
    value_format_name: usd
    sql: ${total_sales} - ${total_cost} ;;
  }

  measure: total_sales_YTD {
    label: "Total Sales YTD"
    type: sum
    value_format_name: usd
    sql: ${sale_dollars} ;;
    filters: [sales_year: "2 years ago"]
  }
  measure: total_sales_LY {
    label: "Total Sales LY"
    type: sum
    value_format_name: usd
    sql: ${sale_dollars} ;;
    filters: [sales_year: "3 years ago"]
  }

  set: detail {
    fields: [invoice_and_item_number,sales_date,  category, items.item_description,iowa_liquor_county.county, iowa_liquor_stores.store_name, total_sales, total_cost, total_benefit, total_margin]
  }
}
