# The name of this view in Looker is "Member Info"
view: member_info {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: "DATA_SETS"."Member_Info" ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Birthday" in Explore.

  dimension: birthday {
    type: string
    sql: ${TABLE}."Birthday" ;;
  }

  dimension: customer_city {
    type: string
    sql: ${TABLE}."Customer_City" ;;
  }

  dimension: customer_id {
    type: number
    sql: ${TABLE}."Customer_ID" ;;
  }

  dimension: customer_prefecture {
    type: string
    sql: ${TABLE}."Customer_Prefecture" ;;
  }

  dimension: gender {
    type: string
    sql: ${TABLE}."Gender" ;;
  }

  dimension: member_registration_date {
    type: string
    sql: ${TABLE}."Member_Registration_Date" ;;
  }

  dimension: number_of_members {
    type: number
    sql: ${TABLE}."Number_of_Members" ;;
  }
  measure: count {
    type: count
  }
  measure: member_amount {
    type: sum
    label: "合計会員数"
    sql: abs(${TABLE}."Number_of_Members") ;;
  }
  measure: men_amount {
    type: sum
    label: "男性会員数"
    sql: case when ${TABLE}."Gender" = '男性' then ${TABLE}."Number_of_Members" else 0 END;;
  }
  measure: women_amount {
    type: sum
    label: "女性会員数"
    sql: case when ${TABLE}."Gender" = '女性' then ${TABLE}."Number_of_Members" else 0 END;;
  }
}
