# Define the database connection to be used for this model.
connection: "looker_dojo_taiyaki"

# include all the views
include: "/views/**/*.view.lkml"

# Datagroups define a caching policy for an Explore. To learn more,
# use the Quick Help panel on the right to see documentation.

datagroup: looker_dojo_taiyaki_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: looker_dojo_taiyaki_default_datagroup

# Explores allow you to join together different views (database tables) based on the
# relationships between fields. By joining a view into an Explore, you make those
# fields available to users for data analysis.
# Explores should be purpose-built for specific use cases.

# To see the Explore you’re building, navigate to the Explore menu and select an Explore under "Looker Dojo Taiyaki"

# To create more sophisticated Explores that involve multiple views, you can use the join parameter.
# Typically, join parameters require that you define the join type, join relationship, and a sql_on clause.
# Each joined view also needs to define a primary key.

explore: budget_data {}

explore: category_master {}

explore: member_info {}

explore: product_master {}

explore: sales_data {}

explore: sales_data_001 {}

explore: sales_data_002 {}

explore: sales_data_003 {}

explore: sales_data_004 {}

explore: sales_data_005 {}

explore: sales_data_006 {}

explore: sales_data_007 {}

explore: sales_data_008 {}

explore: sales_data_009 {}

explore: sales_data_010 {}

explore: sales_data_011 {}

explore: sales_data_012 {}

explore: sales_data_013 {}

explore: sales_data_014 {}

explore: sales_data_015 {}

explore: sales_data_016 {}

explore: sales_data_017 {}

explore: sales_data_018 {}

explore: sales_data_019 {}

explore: sales_data_020 {}

explore: sales_data_021 {}

explore: sales_data_022 {}

explore: sales_data_023 {}

explore: sales_data_024 {}

explore: store_master {}

explore: data_summary {}
