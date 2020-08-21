class AddColumnToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :name, :string
    add_column :users, :area, :string
    add_column :users, :genre, :string
    add_column :users, :age, :string
    add_column :users, :gender, :string
    add_column :users, :country, :string
    add_column :users, :career, :string
    add_column :users, :profile_image, :string
    add_column :users, :self_introduction, :text
    add_column :users, :organization, :string
  end
end
