# encoding: UTF-8

class Content
  include DataMapper::Resource

  Content.property(:id, Serial)
  Content.property(:name, Text, :required => false)
  Content.property(:s, Text, :required => false)
  Content.property(:e, Text, :required => false)
  Content.property(:fullOrgName, Text, :required => false)
  Content.property(:sourceURL, Text, :required => false)
  Content.property(:contentURL, Text, :required => false)
  Content.property(:used, Boolean, :default  => false)

  Content.property(:created_at, DateTime)
  Content.property(:updated_at, DateTime)
end
