# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20181006232829) do

  create_table "configuracao_paginas", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.string "keywords"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pagina_tags", force: :cascade do |t|
    t.integer "pagina_id"
    t.integer "tag_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["pagina_id"], name: "index_pagina_tags_on_pagina_id"
    t.index ["tag_id"], name: "index_pagina_tags_on_tag_id"
  end

  create_table "paginas", force: :cascade do |t|
    t.string "name"
    t.string "slug"
    t.integer "configuracao_pagina_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["configuracao_pagina_id"], name: "index_paginas_on_configuracao_pagina_id"
  end

  create_table "tags", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
