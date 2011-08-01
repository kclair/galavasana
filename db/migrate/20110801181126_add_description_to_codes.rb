class AddDescriptionToCodes < ActiveRecord::Migration
  def self.up
    add_column :codes, :description, :string
  end

  def self.down
    remove_column :codes, :description
  end
end
