class CreateConfiguracaoPaginas < ActiveRecord::Migration[5.1]
  def change
    create_table :configuracao_paginas do |t|
      t.string :title
      t.string :description
      t.string :keywords
      t.timestamps
    end
  end
end
