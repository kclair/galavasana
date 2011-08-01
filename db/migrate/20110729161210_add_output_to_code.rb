class AddOutputToCode < ActiveRecord::Migration
  def self.up
    add_column :codes, :output, :text
  end

  def self.down
    remove_column :codes, :output
  end
end
