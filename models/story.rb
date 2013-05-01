class Story
  include DataMapper::Resource

  # property <name>, <type>
  property :id, Serial
  property :title, String
  property :sentence_summary, String
  property :paragraph_summary, Text
  property :page_summary, Text
  property :four_page_summary, Text

  has n, :characters
  belongs_to :account
end
