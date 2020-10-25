class ChangeIsActiveOfMembers < ActiveRecord::Migration[5.2]
  def up
    change_column :members, :is_active, :boolean, default: 'true'
  end

  def down
    change_column :members, :is_active, :boolean
  end

end
