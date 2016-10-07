# encoding: UTF-8

class ContentSources <  Content
  include DataMapper::Resource

  ContentSources.property(:id, Serial)
  ContentSources.property(:fullOrgName, Text, :required => false)

#  ContentSources.property(:id, Serial)
#  ContentSources.property(:sourceURL, Text, :required => false)
#  ContentSources.property(:contentURL, Text, :required => false)
#  ContentSources.property(:used, Boolean, :default  => false)
#
#  ContentSources.property(:created_at, DateTime)
#  ContentSources.property(:updated_at, DateTime)
  
  
#  Company.property(:id, Serial)
#  Company.property(:name, Text, :required => false)
#  Company.property(:path, Text, :required => false)
#  Company.property(:se, Text, :required => false)
#  Company.property(:fileformat, Text, :required => false)
#  Company.property(:watched_counter, Text, :required => false)
#  Company.property(:got_at, DateTime, :required => false)
#
#  Company.property(:watched, Boolean, :default  => false)
#  Company.property(:moved, Boolean, :default  => false)
#  Company.property(:removed, Boolean, :default  => false) # do not get that again
#
#  Company.property(:proposed, Boolean, :default  => false)
#  Company.property(:proposed_name, Text)
#  Company.property(:proposed_usless, Text)
#  Company.property(:proposed_s, Integer)
#  Company.property(:proposed_e, Integer)
#
#  Company.property(:fixed, Boolean, :default  => false)
#  Company.property(:fixed_name, Text)
#  Company.property(:fixed_usless, Text)
#  Company.property(:fixed_s, Integer)
#  Company.property(:fixed_e, Integer)
#  
#  Company.property(:from_name, Text) # url, or othen on the web side
#  
#  Company.property(:created_at, DateTime)
#  Company.property(:updated_at, DateTime)
end
