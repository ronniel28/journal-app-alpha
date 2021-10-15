class Task < ApplicationRecord
  belongs_to :category
  belongs_to :user

  validates :description, presence: true, length: {minimum: 5, maximum: 100}
  validates :date_task, presence: true
  validates :category, presence: true
  validates :user, presence: true
end
