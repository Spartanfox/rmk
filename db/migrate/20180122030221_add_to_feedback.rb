class AddToFeedback < ActiveRecord::Migration
  def self.up
    add_column :feedbacks, :image_uid, :string  end

  def self.down
    add_column :feedbacks, :image_uid, :string end
end
