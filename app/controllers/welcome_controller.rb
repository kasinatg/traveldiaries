class WelcomeController < ApplicationController
    def index
         @diaries = Diary.where(status: 0)
    end
end
