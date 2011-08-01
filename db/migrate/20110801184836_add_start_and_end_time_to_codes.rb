class AddStartAndEndTimeToCodes < ActiveRecord::Migration
  def self.up
    add_column :codes, :start, :timestamp
    add_column :codes, :end, :timestamp
  end

  def self.down
    remove_column :codes, :end
    remove_column :codes, :start
  end
end
