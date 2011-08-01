class CreateCodes < ActiveRecord::Migration
  def self.up
    create_table :codes do |t|
      t.text :snippet
      t.timestamps
    end
  end

  def self.down
    drop_table :codes
  end
end
