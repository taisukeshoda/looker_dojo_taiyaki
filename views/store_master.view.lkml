# The name of this view in Looker is "Store Master"
view: store_master {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: "DATA_SETS"."Store_Master" ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Area ID" in Explore.

  dimension: area_id {
    type: string
    sql: ${TABLE}."Area_ID" ;;
  }

  dimension: area_of_frozen_food_department {
    type: number
    sql: ${TABLE}."Area_of_Frozen_Food_Department" ;;
  }

  dimension: area_of_grocery_department {
    type: number
    sql: ${TABLE}."Area_of_grocery_department" ;;
  }

  dimension: coffee_bar {
    type: number
    sql: ${TABLE}."Coffee_Bar" ;;
  }

  dimension: delicatessen {
    type: number
    sql: ${TABLE}."Delicatessen" ;;
  }

  dimension: fax_number_store {
    type: string
    sql: ${TABLE}."Fax_Number_Store" ;;
  }

  dimension: flower_shop {
    type: number
    sql: ${TABLE}."Flower_shop" ;;
  }

  dimension: last_remodeling_date {
    type: string
    sql: ${TABLE}."Last_Remodeling_Date" ;;
  }

  dimension: latitude {
    type: number
    sql: ${TABLE}."Latitude" ;;
  }

  dimension: longitude {
    type: number
    sql: ${TABLE}."Longitude" ;;
  }

  dimension: meat_department_area {
    type: number
    sql: ${TABLE}."Meat_Department_Area" ;;
  }

  dimension: opening_date {
    type: string
    sql: ${TABLE}."Opening_Date" ;;
  }

  dimension: phone_number_store {
    type: string
    sql: ${TABLE}."Phone_Number_Store" ;;
  }

  dimension: salad_bar {
    type: number
    sql: ${TABLE}."Salad_Bar" ;;
  }

  dimension: store_area {
    type: string
    sql: ${TABLE}."Store_Area" ;;
  }

  dimension: store_category {
    type: string
    sql: ${TABLE}."Store_Category" ;;
  }

  dimension: store_city_town_village {
    type: string
    sql: ${TABLE}."Store_city_town_village" ;;
  }

  dimension: store_floor_space {
    type: number
    sql: ${TABLE}."Store_floor_space" ;;
  }

  dimension: store_id {
    primary_key: yes
    type: string
    sql: ${TABLE}."Store_ID" ;;
  }

  dimension: store_manager {
    type: string
    sql: ${TABLE}."Store_Manager" ;;
  }

  dimension: store_name {
    type: string
    sql: ${TABLE}."Store_Name" ;;
  }

  dimension: store_number {
    type: number
    sql: ${TABLE}."Store_number" ;;
  }

  dimension: store_prefecture {
    type: string
    sql: ${TABLE}."Store_Prefecture" ;;
  }

  dimension: street_address_store {
    type: string
    sql: ${TABLE}."Street_Address_Store" ;;
  }

  dimension: video_store {
    type: number
    sql: ${TABLE}."Video_Store" ;;
  }
  dimension: customer_location{
    type: location
    sql_latitude: ${TABLE}."Latitude";;
    sql_longitude: ${TABLE}."Longitude" ;;
  }
  dimension: zip_code_store {
    type: number
    sql: ${TABLE}."Zip_Code_Store" ;;
  }
  dimension: store_prefecture_city {
    type: string
    label: "店舗都道府県_市区町村"
    sql: ${store_prefecture}||", "${store_city_town_village};;
  }

  measure: count {
    type: count
    drill_fields: [store_name]
  }
  measure: store_amount {
    type: count_distinct
    label: "店舗数"
    sql: ${TABLE}."Store_ID" ;;
  }

}
