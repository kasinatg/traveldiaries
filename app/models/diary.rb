class Diary < ActiveRecord::Base
    enum status: [:published, :unpublished] 
    validates :diaryname, :content, :keywords, presence: true
    has_many:comments
    belongs_to :user
end
