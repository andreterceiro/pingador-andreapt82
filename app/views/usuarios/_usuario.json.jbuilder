json.extract! usuario, :id, :login, :password, :ativo, :created_at, :updated_at
json.url usuario_url(usuario, format: :json)
