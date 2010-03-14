# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 100) do

  create_table "addresses", :force => true do |t|
    t.string  "owner_type", :null => false
    t.integer "owner_id",   :null => false
    t.integer "city_id",    :null => false
    t.integer "state_id",   :null => false
    t.integer "country_id", :null => false
    t.string  "street"
    t.string  "number"
    t.string  "complement"
    t.string  "district"
    t.string  "zip_code"
  end

  create_table "articles", :force => true do |t|
    t.string   "name"
    t.string   "slug"
    t.text     "path",               :default => ""
    t.integer  "parent_id"
    t.integer  "position"
    t.text     "body"
    t.text     "abstract"
    t.integer  "environment_id"
    t.datetime "updated_on"
    t.datetime "created_on"
    t.integer  "last_changed_by_id"
    t.integer  "version"
    t.integer  "lock_version"
    t.string   "type"
    t.integer  "size"
    t.string   "content_type"
    t.string   "filename"
    t.integer  "height"
    t.integer  "width"
  end

  create_table "balances", :force => true do |t|
    t.float   "value",           :default => 0.0
    t.date    "date"
    t.integer "bank_account_id"
  end

  create_table "bank_accounts", :force => true do |t|
    t.integer "bank_id"
    t.string  "agency"
    t.string  "variation"
    t.string  "account"
    t.boolean "is_default",      :default => false
    t.text    "description"
    t.integer "organization_id"
  end

  create_table "banks", :force => true do |t|
    t.string "name", :null => false
    t.string "code", :null => false
    t.string "site"
  end

  create_table "categories", :force => true do |t|
    t.string  "name",            :null => false
    t.string  "type",            :null => false
    t.integer "parent_id"
    t.integer "organization_id", :null => false
    t.text    "description"
  end

  create_table "cities", :force => true do |t|
    t.string  "name"
    t.integer "state_id"
    t.string  "zip_code"
  end

  create_table "configurations", :force => true do |t|
    t.integer "organization_id"
    t.boolean "is_model"
    t.string  "name"
    t.text    "description"
    t.text    "settings"
  end

  create_table "contacts", :force => true do |t|
    t.string  "name"
    t.string  "phone"
    t.string  "cell_phone"
    t.string  "fax"
    t.string  "email"
    t.integer "category_id"
    t.integer "system_actor_id"
    t.string  "owner_type"
    t.integer "owner_id"
    t.text    "info"
    t.text    "description"
  end

  create_table "countries", :force => true do |t|
    t.string "name"
  end

  create_table "departments", :force => true do |t|
    t.string  "name",            :null => false
    t.integer "organization_id", :null => false
  end

  create_table "departments_documents", :id => false, :force => true do |t|
    t.integer "document_id",   :null => false
    t.integer "department_id", :null => false
  end

  create_table "design_blocks", :force => true do |t|
    t.text    "description"
    t.string  "title"
    t.integer "box_id"
    t.integer "position"
    t.string  "type"
    t.text    "settings"
  end

  create_table "design_boxes", :force => true do |t|
    t.string  "name"
    t.string  "title"
    t.integer "number"
    t.string  "owner_type"
    t.integer "owner_id"
  end

  create_table "display_configurations", :force => true do |t|
    t.string  "owner_type"
    t.integer "owner_id"
    t.string  "type"
    t.integer "configuration_id"
    t.string  "field"
    t.integer "position"
    t.text    "settings"
  end

  create_table "document_items", :force => true do |t|
    t.integer "document_section_id", :null => false
    t.integer "quantity",            :null => false
    t.integer "number"
    t.float   "unitary_value",       :null => false
    t.integer "product_id"
    t.integer "service_id"
  end

  create_table "document_sections", :force => true do |t|
    t.string  "name",        :null => false
    t.integer "document_id", :null => false
  end

  create_table "documents", :force => true do |t|
    t.string  "name",                                 :null => false
    t.boolean "is_model",          :default => false
    t.integer "organization_id",                      :null => false
    t.integer "document_model_id"
    t.text    "body"
    t.string  "owner_type"
    t.integer "owner_id"
  end

  create_table "domains", :force => true do |t|
    t.string  "name"
    t.string  "owner_type"
    t.integer "owner_id"
  end

  create_table "environments", :force => true do |t|
    t.string  "owner_type"
    t.integer "owner_id"
    t.string  "name"
    t.text    "settings"
    t.text    "design_data"
    t.boolean "is_default"
    t.integer "home_page_id"
  end

  create_table "images", :force => true do |t|
    t.string   "content_type"
    t.string   "filename"
    t.string   "thumbnail"
    t.string   "image_hash"
    t.integer  "size"
    t.integer  "width"
    t.integer  "height"
    t.integer  "product_id"
    t.integer  "parent_id"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "invoices", :force => true do |t|
    t.string   "number"
    t.string   "serie"
    t.datetime "issue_date"
    t.integer  "status",      :default => 0
    t.integer  "supplier_id"
  end

  create_table "ledger_categories", :force => true do |t|
    t.string  "name",                                              :null => false
    t.boolean "is_operational",                 :default => false
    t.boolean "is_sale",                        :default => false
    t.boolean "is_stock",                       :default => false
    t.float   "interests",                      :default => 0.0
    t.integer "interests_days",                 :default => 0
    t.integer "number_of_parcels",              :default => 1
    t.integer "organization_id",                                   :null => false
    t.string  "type_of",           :limit => 1,                    :null => false
    t.text    "settings"
    t.integer "periodicity_id"
  end

  create_table "ledgers", :force => true do |t|
    t.string   "owner_type",                                                     :null => false
    t.integer  "owner_id",                                                       :null => false
    t.string   "type_of",                        :limit => 1,                    :null => false
    t.string   "payment_method"
    t.integer  "category_id"
    t.float    "foreseen_value"
    t.float    "effective_value"
    t.string   "description",                                 :default => ""
    t.datetime "date"
    t.datetime "foreseen_date"
    t.datetime "effective_date"
    t.float    "interests",                                   :default => 0.0
    t.integer  "interests_days",                              :default => 0
    t.integer  "number_of_parcels",                           :default => 1
    t.integer  "parcel_number",                               :default => 1
    t.boolean  "operational",                                 :default => false, :null => false
    t.integer  "bank_account_id",                                                :null => false
    t.integer  "status",                                      :default => 0
    t.boolean  "is_operational",                              :default => false
    t.integer  "schedule_ledger_id"
    t.string   "credit_card_number"
    t.date     "credit_card_validity"
    t.string   "credit_card_secutiry_code"
    t.string   "credit_card_owner_name"
    t.string   "credit_card_cnpj"
    t.string   "credit_card_cpf"
    t.integer  "check_bank_id"
    t.string   "check_owner_name"
    t.string   "check_account_agency"
    t.string   "check_account_number"
    t.string   "check_number"
    t.string   "check_contact_telephone"
    t.string   "check_rg"
    t.string   "check_cpf"
    t.string   "check_cnpj"
    t.string   "automatic_debit_owner_name"
    t.integer  "automatic_debit_bank_id"
    t.string   "automatic_debit_account_agency"
    t.string   "automatic_debit_account_number"
    t.integer  "organization_id"
  end

  add_index "ledgers", ["category_id"], :name => "index_ledgers_on_category_id"

  create_table "mass_mail_groups", :force => true do |t|
    t.string  "name",            :null => false
    t.string  "type",            :null => false
    t.integer "organization_id", :null => false
  end

  create_table "mass_mails", :force => true do |t|
    t.string  "subject"
    t.text    "body"
    t.integer "organization_id"
  end

  create_table "organizations", :force => true do |t|
    t.string "name",                                      :null => false
    t.string "cnpj"
    t.text   "design_data"
    t.text   "point_of_sale_design_data"
    t.text   "web_site_design_data"
    t.text   "presentation"
    t.string "identifier",                                :null => false
    t.string "trade_name",                :default => "", :null => false
    t.string "state_registration"
    t.string "responsible_person"
  end

  create_table "people", :force => true do |t|
    t.string   "type"
    t.string   "login"
    t.boolean  "administrator",                           :default => false, :null => false
    t.string   "email"
    t.string   "crypted_password",          :limit => 40
    t.string   "salt",                      :limit => 40
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_token"
    t.datetime "remember_token_expires_at"
  end

  create_table "periodicities", :force => true do |t|
    t.string  "name",            :null => false
    t.integer "number_of_days",  :null => false
    t.integer "organization_id", :null => false
  end

  create_table "printer_commands", :force => true do |t|
    t.string   "cmd",                            :null => false
    t.string   "cmd_params"
    t.integer  "owner_id"
    t.string   "owner_type"
    t.integer  "status",          :default => 0
    t.datetime "datetime",                       :null => false
    t.integer  "sequence_number",                :null => false
    t.integer  "cmd_id",                         :null => false
    t.integer  "counter",         :default => 0
    t.integer  "error_code"
    t.text     "response"
    t.integer  "till_id"
  end

  create_table "printers", :force => true do |t|
    t.string  "name"
    t.string  "serial",          :null => false
    t.integer "organization_id", :null => false
    t.string  "computer_id",     :null => false
  end

  create_table "products", :force => true do |t|
    t.string  "name",            :null => false
    t.integer "code"
    t.string  "size"
    t.string  "color"
    t.text    "description"
    t.float   "sell_price",      :null => false
    t.integer "unit_measure_id"
    t.integer "organization_id", :null => false
    t.integer "category_id",     :null => false
    t.integer "minimum_amount"
    t.text    "info"
  end

  create_table "products_suppliers", :id => false, :force => true do |t|
    t.integer "product_id",  :null => false
    t.integer "supplier_id", :null => false
  end

  create_table "profiles", :force => true do |t|
    t.integer "user_id"
    t.integer "environment_id"
    t.string  "name"
    t.integer "organization_id"
    t.boolean "is_model"
    t.text    "permissions"
  end

  create_table "role_assignments", :force => true do |t|
    t.integer "accessor_id"
    t.string  "accessor_type"
    t.integer "resource_id"
    t.string  "resource_type"
    t.integer "role_id"
    t.boolean "is_global"
  end

  create_table "roles", :force => true do |t|
    t.string "name"
    t.string "permissions"
  end

  create_table "sale_items", :force => true do |t|
    t.integer "sale_id",                        :null => false
    t.integer "product_id",                     :null => false
    t.float   "amount",        :default => 0.0, :null => false
    t.float   "unitary_price", :default => 0.0, :null => false
    t.integer "status",        :default => 0
    t.integer "stock_id"
  end

  create_table "sales", :force => true do |t|
    t.integer  "organization_id",                :null => false
    t.integer  "customer_id"
    t.datetime "datetime",                       :null => false
    t.integer  "status",          :default => 0, :null => false
    t.integer  "user_id",                        :null => false
    t.integer  "till_id"
  end

  create_table "schedule_ledgers", :force => true do |t|
    t.integer  "periodicity_id"
    t.datetime "start_date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "interval"
  end

  create_table "schedules", :force => true do |t|
    t.datetime "created_at", :null => false
  end

  create_table "states", :force => true do |t|
    t.string  "name"
    t.string  "code"
    t.integer "country_id"
  end

  create_table "stocks", :force => true do |t|
    t.string   "type",                       :null => false
    t.float    "price"
    t.integer  "product_id",                 :null => false
    t.float    "amount",                     :null => false
    t.integer  "purpose",     :default => 0
    t.integer  "status",      :default => 0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "supplier_id"
    t.date     "date"
    t.date     "validity"
    t.integer  "sell_id"
    t.integer  "invoice_id"
  end

  create_table "system_actor_mass_mail_groups", :force => true do |t|
    t.integer "system_actor_id"
    t.integer "mass_mail_group_id"
  end

  create_table "system_actors", :force => true do |t|
    t.string  "name",            :null => false
    t.integer "organization_id", :null => false
    t.string  "address"
    t.text    "description"
    t.string  "email"
    t.string  "type"
    t.integer "category_id",     :null => false
    t.text    "info"
    t.string  "cnpj"
    t.string  "cpf"
    t.string  "rg"
    t.date    "birthday"
  end

  create_table "taggings", :force => true do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.string   "taggable_type"
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id"], :name => "index_taggings_on_tag_id"
  add_index "taggings", ["taggable_id", "taggable_type"], :name => "index_taggings_on_taggable_id_and_taggable_type"

  create_table "tags", :force => true do |t|
    t.string "name"
  end

  create_table "tills", :force => true do |t|
    t.datetime "datetime",                       :null => false
    t.integer  "status",          :default => 0
    t.string   "printer_id"
    t.integer  "user_id",                        :null => false
    t.integer  "organization_id",                :null => false
  end

  create_table "trackers", :force => true do |t|
    t.integer "available_points", :default => 0
    t.integer "organization_id"
    t.integer "product_points",   :default => 0
    t.integer "customer_points",  :default => 0
    t.integer "supplier_points",  :default => 0
    t.integer "worker_points",    :default => 0
    t.integer "ledger_points",    :default => 0
    t.integer "document_points",  :default => 0
    t.integer "points_per_user",  :default => 0
    t.integer "website_points",   :default => 0
  end

  create_table "unit_measures", :force => true do |t|
    t.string  "name",            :null => false
    t.string  "abbreviation",    :null => false
    t.integer "organization_id"
  end

end
