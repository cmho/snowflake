migration 2, :create_stories do
  up do
    create_table :stories do
      column :id, Integer, :serial => true
      column :title, String, :length => 255
      column :sentence_summary, String, :length => 255
      column :paragraph_summary, "TEXT"
      column :page_summary, "TEXT"
      column :four_page_summary, "TEXT"
    end
  end

  down do
    drop_table :stories
  end
end
