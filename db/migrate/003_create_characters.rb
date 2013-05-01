migration 3, :create_characters do
  up do
    create_table :characters do
      column :id, Integer, :serial => true
      column :name, String, :length => 255
      column :sentence_summary, String, :length => 255
      column :motivation, "TEXT"
      column :goal, "TEXT"
      column :conflict, "TEXT"
      column :epiphany, "TEXT"
      column :paragraph_summary, "TEXT"
      column :long_summary, "TEXT"
      column :history, "TEXT"
    end
  end

  down do
    drop_table :characters
  end
end
