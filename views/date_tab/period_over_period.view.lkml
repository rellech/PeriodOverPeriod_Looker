# The name of this view in Looker is "Period Over Period"
view: period_over_period {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name:
    {% if period_over_period.Period._is_filtered %}
        `renielle-chavez-sandbox1.raw_us.period_over_period`
    {% else %}
        (select 1 as dummy)
    {% endif %}  ;;


  dimension_group: fin_c {
    type: time
    timeframes: [date]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.fin_c ;;
    hidden: no
  }

  dimension_group: fin_p {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.fin_p ;;
    hidden: no
  }

  dimension_group: ini_c {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.ini_c ;;
    hidden: no
  }

  dimension_group: ini_p {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.ini_p ;;
    hidden: no
  }
    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Po P" in Explore.


  dimension: Period {
    type: string
    sql: ${TABLE}.PoP ;;


  }
  dimension: period_dates {
    type: date_time
    datatype: datetime
   sql: 1=1;;
  }
  #correct
  filter: date_filter {
    type: date_time
    datatype: datetime

    sql: true ;;
  }

  filter: period_dates_f {
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
# dimension:both {
#   link: {}
#   sql: {% if type_of_filter._parameter_value == "pop_pre" %}
#   ${period_dates_f}
#   {% elsif type_of_filter._parameter_value == "pop_ran" %}
#   ${date_filter}
#   {%end%}
#   ;;
# }


}
