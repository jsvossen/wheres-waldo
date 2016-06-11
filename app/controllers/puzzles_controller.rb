class PuzzlesController < ApplicationController

	def index
		@puzzles = Puzzle.all
	end

	def show
		@puzzle = Puzzle.find(params[:id])
		@targets = @puzzle.targets
	end

	def find_character
		@char = Target.find(params[:cid])
		if @char.is_at_coord?(params[:x],params[:y])
			render json: @char.position_data
		else
			render json: "false"
		end
	end

end
