# The name of this view in Looker is "Sales Data"
view: sales_data {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: "DATA_SETS"."Sales_Data" ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Cost of Sales" in Explore.

  dimension: cost_of_sales {
    type: number
    label: "原価"
    sql: ${TABLE}."Cost_of_Sales" ;;
  }

  dimension: customer_id {
    type: number
    sql: ${TABLE}."Customer_ID" ;;
  }

  dimension: gross_profit {
    type: number
    label: "売上総利益"
    sql: ${TABLE}."Gross_Profit" ;;
  }

  dimension: order_date_key {
    type: number
    sql: ${TABLE}."Order_date_KEY" ;;
  }

  dimension: product_id {
    type: string
    sql: ${TABLE}."Product_ID" ;;
  }

  dimension: quantity {
    type: number
    label: "売上量"
    sql: ${TABLE}."Quantity" ;;
  }

  dimension: sales {
    type: number
    label: "売上"
    sql: ${TABLE}."Sales" ;;
  }

  dimension: sales_date {
    type: date
    sql:TO_DATE(${TABLE}."Sales_Date", 'YYYY/MM/DD') ;;
  }

  dimension_group: date {
    type: time
    label: "売上日"
    timeframes: [raw, date, week, month, quarter, year]
    sql: TO_DATE(${TABLE}."Sales_Date", 'YYYY/MM/DD');;
  }

  dimension: store_id {
    type: string
    sql: ${TABLE}."Store_ID" ;;
  }

  dimension: voucher_number {
    type: string
    primary_key: yes
    sql: ${TABLE}."Voucher_Number" ;;
  }
  dimension: sales_comparison {
    type: yesno
    sql: ${TABLE}."Sales" >= 500 ;;
  }
  measure: count {
    type: count
  }
  measure: average_sales {
    type: average
    label: "平均売上額"
    value_format: "\"￥\"#,##0"
    sql: abs(${TABLE}."Sales") ;;
  }
  measure: sum_sales {
    type: sum
    label: "売上金額"
    value_format: "\"￥\"#,##0"
    sql: abs(${TABLE}."Sales") ;;
  }
  measure: sum_profit {
    type: sum
    label: "利益"
    value_format: "\"￥\"#,##0"
    sql: abs(${TABLE}."Gross_Profit") ;;
    }
}
