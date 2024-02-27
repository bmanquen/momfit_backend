json.id event.id
json.image event.image
json.title event.title
json.description event.description
json.date event.date
json.location event.location
json.cost event.cost
json.created_at event.created_at
json.updated_at event.updated_at
json.url event.url
json.summary event.summary

childcare_value = if event.childcare.present?
  Event.human_attribute_name("childcare.#{event.childcare}")
else
  nil
end
json.childcare childcare_value