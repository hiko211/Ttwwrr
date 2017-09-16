class AddUserIdToBlogs < ActiveRecord::Migration
  def change
    add_column :blogs, :user_name, :integer
  end
end
