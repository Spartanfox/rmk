class CreateFeedbacks < ActiveRecord::Migration
  def change
    create_table :feedbacks do |t|
      t.string :ward_or_department
      t.string :room_number
      t.text :positive_aspects
      t.text :could_do_better
      t.boolean :feel_well_informed
      t.text :please_comment
      t.boolean :aware_of_rights
      t.boolean :read_it_in_booklet
      t.boolean :read_it_in_brochure
      t.boolean :read_it_in_directory
      t.boolean :understand_rights
      t.text :other_comments
      t.string :first_name
      t.string :last_name
      t.string :email
      t.text :address
      t.string :telephone
      t.string :involved_in_forum
      t.boolean :wish_to_be_contacted
      # Friendly ID
      t.string  :slug
      t.timestamps
    end
    add_index :feedbacks, :slug, :unique => true
  end
end
