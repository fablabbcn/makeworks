json.extract! process_taxonomy, :id, :m_id, :name, :parent_id, :created_at, :updated_at
json.url process_taxonomy_url(process_taxonomy, format: :json)
