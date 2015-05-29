class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.integer :value, limit: 1
      t.references :sentence, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end

    # One rating per user per sentence.
    add_index :ratings, [:user_id, :sentence_id], :unique => true
  end
end
