Rails.application.routes.draw do
  resources :pagina_tags
  resources :tags
  resources :configuracao_paginas
  resources :paginas
  root to: 'visitors#index'
end
