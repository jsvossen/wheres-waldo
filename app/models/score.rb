class Score < ActiveRecord::Base
  belongs_to :puzzle

  scope :by_best_time, -> { order(seconds: :asc) }
end
