# encoding: UTF-8

class ContentSources
  include DataMapper::Resource

  ContentSources.property(:id, Serial)
  ContentSources.property(:name, Text, :required => false)
  ContentSources.property(:s, Text, :required => false)
  ContentSources.property(:e, Text, :required => false)
  ContentSources.property(:fullOrgName, Text, :required => false)
  ContentSources.property(:sourceURL, Text, :required => false)
  ContentSources.property(:contentURL, Text, :required => false)
  ContentSources.property(:used, Boolean, :default  => false)
  ContentSources.property(:fullOrgName, Text, :required => false)
end
