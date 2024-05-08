include: "/1_base/period_over_period.view.lkml"
view: +period_over_period {
  sql_table_name: `renielle-chavez-sandbox1.raw_us.period_over_period`;;
    # {% if period_over_period.period_defined_filter._is_filtered and period_over_period.type_of_filter._parameter_value = "poppre" %}
    # {% elsif period_over_period.type_of_filter._parameter_value <> "poppre"%}
    #       (select 1 as dummy)
    # {% else %}
    #       `renielle-chavez-sandbox1.raw_us.period_over_period`
    #       {% period_defined_filter %}
    # {% endif %}  ;;


  filter: period_defined_filter {
    type: string
    suggest_dimension: Period
    sql:  {% condition period_defined_filter %} ${Period} {% endcondition %};;
  }

  dimension_group: ini_c {
    hidden: no

  }
  dimension_group: ini_c_range {
   sql: {% date_start sales_periods_base.date_range_filter %} ;;
  }
  dimension_group: fin_c_range {
    sql: {% date_end sales_periods_base.date_range_filter %} ;;
  }
  dimension_group: ini_p_range {
    sql:  DATE_SUB( {% date_start sales_periods_base.date_range_filter %}, INTERVAL 1 YEAR )  ;;
  }
  dimension_group: fin_p_range {
    sql: DATE_SUB( {% date_end sales_periods_base.date_range_filter %}, INTERVAL 1 YEAR )  ;;
  }

  dimension_group: ini_p {
    hidden: no
  }
  dimension_group: fin_c {
    hidden: no
  }
  dimension_group: fin_p {
    hidden: no
  }
  measure: count {
    hidden: yes
  }

  dimension: Period {
    type: string
    sql: ${TABLE}.PoP ;;
    hidden: no
  }


}
