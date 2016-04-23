class CreateDiaries < ActiveRecord::Migration
  def change
    create_table :diaries do |t|
      t.string :diaryname
      t.date :published
      t.text :content
      t.integer :status, default: 1
      t.string :keywords

      t.timestamps null: false
    end
  end
end
