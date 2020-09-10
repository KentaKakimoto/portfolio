class AddReadFlagToMessages < ActiveRecord::Migration[6.0]
  def change
    add_column :messages, :read_flag, :boolean, default: false, null: false
  end
end
