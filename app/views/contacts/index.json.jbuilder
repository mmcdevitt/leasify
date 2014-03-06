json.array!(@contacts) do |contact|
  json.extract! contact, :id, :first_name, :last_name, :company, :job_title, :phone, :email, :user_id
  json.url contact_url(contact, format: :json)
end
