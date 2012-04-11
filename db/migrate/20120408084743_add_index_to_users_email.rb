class AddIndexToUsersEmail < ActiveRecord::Migration
  def change
    # unique: true命令确保在数据库层面email参数也是唯一的
    add_index :users, :email, unique: true
  end
end
