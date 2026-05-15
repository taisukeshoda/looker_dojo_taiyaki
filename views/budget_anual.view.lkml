view: budget_anual {
  derived_table: {
    sql:
      SELECT
        "Sales_Date" AS data_date,
        "Store_ID"   AS store_id,
        "Sales"      AS amount,
        '実績'     AS data_source_type
      FROM "DATA_SETS"."Sales_Data"

      UNION ALL

      SELECT
      "Budget_Year"   AS data_date,
      "Store_ID"      AS store_id,
      "Budget_Amount" AS amount,
      '計画'        AS data_source_type
      FROM "DATA_SETS"."Budget_Data" ;;
  }

  # ─── Lookerの画面（Explore）に表示するための定義 ───

  # 各行がどちらのデータかを示すディメンション
  dimension: data_source_type {
    type: string
    label: "データ種別（実績/計画）"
    sql: ${TABLE}.data_source_type ;;
  }
  dimension: data_date {
    type: date
    sql: TO_DATE(${TABLE}.data_date, 'YYYY/MM/DD');;
  }
  dimension_group: date {
    type: time
    label: "日付"
    timeframes: [raw, date, week, month, quarter, year]
    sql: TO_DATE(${TABLE}.data_date, 'YYYY/MM/DD');;
  }
  dimension: amount {
    type: number
    label: "金額"
    value_format: "\"￥\"#,##0"
    sql: ${TABLE}.amount;;
    }
  dimension: store_id {
    type: string
    label: "ストアID"
    sql: floor(${TABLE}.store_id)::varchar;;
  }
  # 共通の金額メジャー
  measure: total_amount {
    type: sum
    label: "金額合計"
    value_format: "\"￥\"#,##0"
    sql: ${TABLE}.amount ;;
  }
  measure: total_actual_amount {
    type: sum
    label: "実績合計"
    sql: CASE WHEN ${TABLE}.data_source_type = '実績' THEN ${TABLE}.amount ELSE 0 END ;;
    value_format: "\"￥\"#,##0"
  }

  measure: total_budget_amount {
    type: sum
    label: "計画合計"
    sql: CASE WHEN ${TABLE}.data_source_type = '計画' THEN ${TABLE}.amount ELSE 0 END ;;
    value_format: "\"￥\"#,##0"
  }

  measure: achievement_rate {
    type: number
    label: "計画達成率"
    sql: 1.0 * ${total_actual_amount} / NULLIF(${total_budget_amount}, 0) ;;
    value_format_name: percent_1
  }
}
