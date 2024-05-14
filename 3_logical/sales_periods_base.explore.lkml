include: "/2_standard/sales.layer.view.lkml"
include: "/2_standard/period_over_period.layer.view.lkml"


explore: sales_periods_base {
  extension: required
  view_name: sales_periods_base
  join:  period_over_period{
    # sql_table_name: period_over_period  ;;
    relationship: one_to_one
    sql_on: true;;
  }
}

view: sales_periods_base {
  extends: [sales]

  parameter: type_of_filter{
    type: unquoted
    view_label: "Period Over Period"

    allowed_value: {
      label: "Period Defined Filter"
      value: "poppre"
    }
    allowed_value: {
      label: "Period Range Filter"
      value: "popran"
    }
  }
  #correct
  filter: date_range_filter {
    view_label: "Period Over Period"
    type: date_time
    datatype: datetime
    sql: true ;;
  }

  measure: total_state_bottle_cost {
    type: sum
    sql: ${state_bottle_cost} ;;  }
  measure: average_state_bottle_cost {
    type: average
    sql: ${state_bottle_cost} ;;  }

  measure: total_state_bottle_cost_0 {
    type: sum
    label: "tot state bottle cost @{past_period_0}"
    sql:
        {% if sales_periods_base.type_of_filter._parameter_value == 'poppre' %}
            case when  ${TABLE}.date BETWEEN period_over_period.ini_c and period_over_period.fin_c
                 then ${TABLE}.state_bottle_cost end
        {% elsif sales_periods_base.type_of_filter._parameter_value == 'popran' %}
            case when  ( ${TABLE}.date) BETWEEN  {% date_start sales_periods_base.date_range_filter %} AND {% date_end sales_periods_base.date_range_filter %}
                 then ${TABLE}.state_bottle_cost else null end
        {% else %}
            null
        {% endif %}   ;;

    }
    measure: total_state_bottle_cost_1 {
      type: sum
      label: "tot state bottle cost @{past_period_1}"
      sql:
          {% if sales_periods_base.type_of_filter._parameter_value == 'poppre' %}
              case when  ${TABLE}.date BETWEEN period_over_period.ini_p and period_over_period.fin_p
                   then ${TABLE}.state_bottle_cost end
          {% elsif sales_periods_base.type_of_filter._parameter_value == 'popran' %}
            case when  ( ${TABLE}.date) BETWEEN DATE_SUB( {% date_start sales_periods_base.date_range_filter %}, INTERVAL 1 YEAR ) AND DATE_SUB( {% date_end sales_periods_base.date_range_filter %}, INTERVAL 1 YEAR )
                 then ${TABLE}.state_bottle_cost else null end
          {% else %}
              null
          {% endif %}   ;;

      }

    #   measure: average_state_bottle_cost_lp {
    #     type: sum
    #     sql:  {% if period_over_period.Period._is_filtered %}
    #       case when  ${TABLE}.date BETWEEN period_over_period.ini_p and period_over_period.fin_p then ${TABLE}.state_bottle_cost end
    #       {% elsif period_over_period.date_filter._is_filtered  %}
    #       case when  ( ${TABLE}.date) BETWEEN  DATE_SUB( {% date_start period_over_period.date_filter %}, INTERVAL 1 YEAR ) AND DATE_SUB( {% date_end period_over_period.date_filter %}, INTERVAL 1 YEAR )
    #       then
    #       ${TABLE}.state_bottle_cost
    #       else null end
    #   {% else %}
    #   null
    #   {% endif %}   ;;
    #   }

    #   measure: average_state_bottle_cost_cpd {
    #     type: sum
    #     sql:
    #       case when  ( ${TABLE}.date) between  {% date_start period_over_period.date_filter %} AND {% date_end period_over_period.date_filter %}
    #       then
    #       ${TABLE}.state_bottle_cost
    #       else null end
    #       ;;
    #   }

    #   measure: average_state_bottle_cost_lpd {
    #     type: sum
    #     sql:
    #       case when  ( ${TABLE}.date) between  DATE_SUB( {% date_start period_over_period.date_filter %}, INTERVAL 1 YEAR ) AND DATE_SUB( {% date_end period_over_period.date_filter %}, INTERVAL 1 YEAR )
    #       then
    #       ${TABLE}.state_bottle_cost
    #       else null end
    #       ;;
    #   }

    #   measure: average_state_bottle_cost_nf {
    #     type: sum
    #     sql:{% if period_over_period.period_dates_f._is_filtered %}
    #       case when  ( ${TABLE}.date) between  DATE_SUB( {% date_start period_over_period.date_filter %}, INTERVAL 1 YEAR ) AND DATE_SUB( {% date_end period_over_period.date_filter %}, INTERVAL 1 YEAR )
    #       then
    #       ${TABLE}.state_bottle_cost
    #       else null end

    #   {% else %}
    #   null
    #   {% endif %} ;;
    #   }
    #   dimension: date_ini {
    #     type: date_time
    #     sql:  DATE_SUB( {% date_start period_over_period.date_filter %}, INTERVAL 1 YEAR )  ;;
    #   }

    }
