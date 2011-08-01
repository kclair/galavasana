class AddStatusToCodes < ActiveRecord::Migration
  def self.up
    add_column :codes, :status, :string
  end

  def self.down
    remove_column :codes, :status
  end
end
