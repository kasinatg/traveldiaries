class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :description
      t.datetime :createddate

      t.timestamps null: false
    end
  end
end
