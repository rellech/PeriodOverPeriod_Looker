# The name of this view in Looker is "Sales"
view: sales {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `renielle-chavez-sandbox1.raw_us.sales` ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Address" in Explore.

  dimension: address {
    type: string
    sql: ${TABLE}.address ;;
  }

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

  dimension: category_name {
    type: string
    sql: ${TABLE}.category_name ;;
  }

  dimension: city {
    type: string
    sql: ${TABLE}.city ;;
  }

  dimension: county {
    type: string
    sql: ${TABLE}.county ;;
  }

  dimension: county_number {
    type: string
    sql: ${TABLE}.county_number ;;
  }
  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: date {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.date ;;
  }
    # sql: CAST(${TABLE}.date AS TIMESTAMP);; # --#${TABLE}.date




  dimension: invoice_and_item_number {
    type: string
    sql: ${TABLE}.invoice_and_item_number ;;
  }

  dimension: item_description {
    type: string
    sql: ${TABLE}.item_description ;;
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

  dimension: state_bottle_cost {
    type: number
    sql: ${TABLE}.state_bottle_cost ;;
  }



  dimension: state_bottle_retail {
    type: number
    sql: ${TABLE}.state_bottle_retail ;;
  }

  dimension: store_location {
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

  dimension: vendor_name {
    type: string
    sql: ${TABLE}.vendor_name ;;
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

  dimension: zip_code {
    type: zipcode
    sql: ${TABLE}.zip_code ;;
  }


  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_state_bottle_cost {
    type: sum
    sql: ${state_bottle_cost} ;;  }
  measure: average_state_bottle_cost {
    type: average
    sql: ${state_bottle_cost} ;;  }

  measure: total_state_bottle_cost_cp {
    type: sum
    sql:  {% if period_over_period.Period._is_filtered %}
    case when  ${TABLE}.date between period_over_period.ini_c and period_over_period.fin_c then sales.state_bottle_cost end

  {% else %}
    null
  {% endif %}   ;;

    }
  measure: average_state_bottle_cost_lp {
    type: sum
    sql:  {% if period_over_period.Period._is_filtered %}
          case when  ${TABLE}.date between period_over_period.ini_p and period_over_period.fin_p then sales.state_bottle_cost end
          {% elsif period_over_period.date_filter._is_filtered  %}
           case when  ( ${TABLE}.date) between  DATE_SUB( {% date_start period_over_period.date_filter %}, INTERVAL 1 YEAR ) AND DATE_SUB( {% date_end period_over_period.date_filter %}, INTERVAL 1 YEAR )
          then
          sales.state_bottle_cost
          else null end
      {% else %}
      null
      {% endif %}   ;;
      }

  measure: average_state_bottle_cost_cpd {
    type: sum
    sql:
          case when  ( ${TABLE}.date) between  {% date_start period_over_period.date_filter %} AND {% date_end period_over_period.date_filter %}
          then
          sales.state_bottle_cost
          else null end
          ;;
  }

  measure: average_state_bottle_cost_lpd {
    type: sum
    sql:
          case when  ( ${TABLE}.date) between  DATE_SUB( {% date_start period_over_period.date_filter %}, INTERVAL 1 YEAR ) AND DATE_SUB( {% date_end period_over_period.date_filter %}, INTERVAL 1 YEAR )
          then
          sales.state_bottle_cost
          else null end
          ;;
  }

  measure: average_state_bottle_cost_nf {
    type: sum
    sql:{% if period_over_period.period_dates_f._is_filtered %}
          case when  ( ${TABLE}.date) between  DATE_SUB( {% date_start period_over_period.date_filter %}, INTERVAL 1 YEAR ) AND DATE_SUB( {% date_end period_over_period.date_filter %}, INTERVAL 1 YEAR )
          then
          sales.state_bottle_cost
          else null end

      {% else %}
      null
      {% endif %} ;;
  }
dimension: date_ini {
  type: date_time
  sql:  DATE_SUB( {% date_start period_over_period.date_filter %}, INTERVAL 1 YEAR )  ;;
}

  measure: count {
    type: count
    drill_fields: [category_name, vendor_name, store_name]
  }
}
