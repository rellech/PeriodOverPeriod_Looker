include: "/1_base/period_over_period.view.lkml"
view: +period_over_period {
  sql_table_name:
    {% if period_over_period.Period._is_filtered %}
          `renielle-chavez-sandbox1.raw_us.period_over_period`
    {% else %}
           (select 1 as dummy)
    {% endif %}  ;;

    dimension_group: fin_c {
      hidden: yes
    }

    dimension: Period {
      type: string
      sql: ${TABLE}.PoP ;;
      hidden: yes
    }

    #correct
    filter: date_range_filter {
      type: date_time
      datatype: datetime

      sql: true ;;
    }

    filter: period_defined_filter {
      type: string
      suggest_dimension: Period
      sql: true;;
    }

    parameter: type_of_filter{
      type: unquoted
      allowed_value: {
        label: "PoP Predefinido"
        value: "pop_pre"
      }
      allowed_value: {
        label: "PoP Range"
        value: "pop_ran"
      }
    }

  }
