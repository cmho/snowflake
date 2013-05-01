class Character
  include DataMapper::Resource

  # property <name>, <type>
  property :id, Serial
  property :name, String
  property :sentence_summary, String
  property :motivation, Text
  property :goal, Text
  property :conflict, Text
  property :epiphany, Text
  property :paragraph_summary, Text
  property :long_summary, Text
  property :history, Text
end
