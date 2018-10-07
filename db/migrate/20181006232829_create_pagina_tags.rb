class CreatePaginaTags < ActiveRecord::Migration[5.1]
  def change
    create_table :pagina_tags do |t|
      t.references :pagina, foreign_key: true
      t.references :tag, foreign_key: true

      t.timestamps
    end
  end
end
