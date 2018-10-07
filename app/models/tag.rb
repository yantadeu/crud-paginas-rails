class Tag < ApplicationRecord
  scope :tag_pagina, -> (pagina_id) { where ("id in (select tag_id from pagina_tags where pagina_id = "+pagina_id.to_s+")")}

end
