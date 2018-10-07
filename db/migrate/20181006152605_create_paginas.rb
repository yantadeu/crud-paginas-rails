class CreatePaginas < ActiveRecord::Migration[5.1]
  def change
    create_table :paginas do |t|
      t.string :name
      t.string :slug
      t.references :configuracao_pagina, foreign_key: true
      t.timestamps
    end
  end
end
