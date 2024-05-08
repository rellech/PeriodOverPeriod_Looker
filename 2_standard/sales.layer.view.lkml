include: "/1_base/sales.view.lkml"
view: +sales {

  dimension_group: date {
    type: time
    timeframes: [raw, date, day_of_month, week, week_of_year, day_of_week_index, month, month_name, month_num, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.date ;;
  }
  dimension: month_day {
    type: string
    group_label: "Date Date"
    sql: CAST(FORMAT_DATETIME("%h %d", ${TABLE}.date ) AS STRING);;
  }
  # dimension: order_date {
  #   type: number
  #   group_label: "Date Date"
  #   sql: CAST(FORMAT_DATETIME("%h %d", ${TABLE}.date ) AS STRING);;
  # }
}
