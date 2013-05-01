migration 5, :add_user_to_story do
  up do
    modify_table :stories do
      add_column :user_id, Integer
    end
  end

  down do
    modify_table :stories do
      drop_column :user_id
    end
  end
end
