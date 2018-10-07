json.extract! configuracao_pagina, :id, :title, :description, :keywords, :pagina_id, :created_at, :updated_at
json.url configuracao_pagina_url(configuracao_pagina, format: :json)
