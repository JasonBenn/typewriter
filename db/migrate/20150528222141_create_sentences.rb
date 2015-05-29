class CreateSentences < ActiveRecord::Migration
  def change
    create_table :sentences do |t|
      t.string :sentence
      t.references :word, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end

    # One sentence per user per word.
    add_index :sentences, [:word_id, :user_id], :unique => true
  end
end
