include: "/1_base/sales.view.lkml"
view: +sales {

  dimension_group: date {
    type: time
    timeframes: [raw, date, week, month,month_name, month_num, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.date ;;
  }
}
