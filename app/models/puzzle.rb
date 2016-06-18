class Puzzle < ActiveRecord::Base
	has_many :targets
	has_many :scores

	def full_img
		"puzzles/"+image
	end

	def tmb_img
		"puzzles/tmb/"+image
	end

	def high_score
		self.scores.minimum(:seconds)
	end

	def is_high_score?(score)
		if self.high_score
			score <= self.high_score
		else
			true
		end
	end

end
