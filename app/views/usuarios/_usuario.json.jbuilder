json.extract! usuario, :id, :login, :password, :active, :created_at, :updated_at
json.url usuario_url(usuario, format: :json)
