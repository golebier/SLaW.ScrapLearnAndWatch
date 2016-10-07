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
