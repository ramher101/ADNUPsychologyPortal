class Subject < ApplicationRecord
  validates :subject_title, presence:true
end
