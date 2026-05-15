view: budget_anual {
  derived_table: {
    sql:
      # 1. 実績テーブルから取得し、定数として 'Actual' を持つ列を追加
      SELECT
        "Sales_Date" AS data_date,
        "Store_ID"   AS store_id,
        "Sales"      AS amount,
        'Actual'     AS data_source_type  # ★ここが識別フラグになります
      FROM "DATA_SETS"."Sales_Data"

      UNION ALL

      # 2. 計画テーブルから取得し、定数として 'Budget' を持つ列を追加
      SELECT
      "Budget_Year"   AS data_date,
      "Store_ID"      AS store_id,
      "Budget_Amount" AS amount,
      'Budget'        AS data_source_type  # ★列名とデータ型を1つ目のSELECTと完全に揃えます
      FROM "DATA_SETS"."Budget_Data" ;;
  }

  # ─── Lookerの画面（Explore）に表示するための定義 ───

  # 各行がどちらのデータかを示すディメンション
  dimension: data_source_type {
    type: string
    label: "データ種別（実績/計画）"
    sql: ${TABLE}.data_source_type ;;
  }

  # 共通の日付ディメンション
  dimension_group: data_date {
    type: time
    timeframes: [raw, date, month, year]
    convert_tz: no
    datatype: date
    sql: TO_DATE(${TABLE}."data_date", 'YYYY/MM/DD') ;;
  }

  # 共通の金額メジャー
  measure: total_amount {
    type: sum
    label: "金額合計"
    sql: ${TABLE}.amount ;;
  }
}
