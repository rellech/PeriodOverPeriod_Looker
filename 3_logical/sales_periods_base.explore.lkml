include: "/2_standard/sales.layer.view.lkml"
include: "/2_standard/period_over_period.layer.view.lkml"

view: sales_periods_base {
  extends: [sales]
  measure: total_state_bottle_cost {
    type: sum
    sql: ${state_bottle_cost} ;;  }
  measure: average_state_bottle_cost {
    type: average
    sql: ${state_bottle_cost} ;;  }

  measure: total_state_bottle_cost_cp {
    type: sum
    sql:
    {% if period_over_period.Period._is_filtered %}
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
  }

  explore: sales_periods_base {
    extension: required
    view_name: sales_periods_base
    join: period_over_period {
      relationship: one_to_one
      sql_on: 1=1 ;;
    }
  }
