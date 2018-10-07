class Pagina < ApplicationRecord
  has_one :configuracao_pagina, dependent: :destroy
  has_many :tag, dependent: :destroy
  scope :id_not_in_table, -> { where ("id not in (select pagina_id from configuracao_paginas)")}
end
