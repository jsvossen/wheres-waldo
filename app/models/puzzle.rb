class Puzzle < ActiveRecord::Base
	has_many :targets


	def full_img
		"puzzles/"+image
	end

	def tmb_img
		"puzzles/tmb/"+image
	end

end
