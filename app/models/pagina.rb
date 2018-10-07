class Pagina < ApplicationRecord
  has_one :configuracao_pagina, dependent: :destroy
  has_many :tag, dependent: :destroy
  scope :id_not_in_table, -> { where ("id not in (select pagina_id from configuracao_paginas)")}

  def get_tags(id)
    pagina_tags = PaginaTag.where(:pagina_id=>id)
    tags_page = []
    for p_tag in pagina_tags
      tag = Tag.find(p_tag.tag_id)
      tags_page << tag
    end
    tags_page
  end
end
