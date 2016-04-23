class AddDiaryToComments < ActiveRecord::Migration
  def change
    add_reference :comments, :diary, index: true, foreign_key: true
  end
end
