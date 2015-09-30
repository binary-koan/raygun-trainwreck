class Wreck
  include Mongoid::Document
  field :message, type: String
  field :is_epic, type: Mongoid::Boolean
  field :is_boring, type: Mongoid::Boolean
  field :is_spectacular, type: Mongoid::Boolean

  # Random validations for testing

  validates_uniqueness_of :message
  validates_length_of :message, minimum: 10, maximum: 100

  before_validation do |doc|
    if doc.is_boring && (doc.is_epic || doc.is_spectacular)
      doc.errors.add :is_boring, "An error can't be epic or spectacular if it's boring!"
    end
  end
end
