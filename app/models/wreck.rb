class Wreck
  include Mongoid::Document
  field :message, type: String
  field :is_epic, type: Mongoid::Boolean
  field :is_boring, type: Mongoid::Boolean
  field :is_spectacular, type: Mongoid::Boolean
end
