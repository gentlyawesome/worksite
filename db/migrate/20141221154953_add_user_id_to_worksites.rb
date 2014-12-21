class AddUserIdToWorksites < ActiveRecord::Migration
  def change
    add_column :worksites, :user_id, :integer
  end
end
