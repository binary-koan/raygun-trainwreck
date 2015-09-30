json.array!(@wrecks) do |wreck|
  json.extract! wreck, :id, :message, :is_epic, :is_boring, :is_spectacular
  json.url wreck_url(wreck, format: :json)
end
