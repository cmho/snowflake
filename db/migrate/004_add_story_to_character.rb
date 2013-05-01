migration 4, :add_story_to_character do
  up do
    modify_table :characters do
      add_column :story_id, Integer
    end
  end

  down do
    modify_table :characters do
      drop_column :story_id
    end
  end
end
