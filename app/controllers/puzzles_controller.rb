class PuzzlesController < ApplicationController

	def index
		@puzzles = Puzzle.all
	end

	def show
		@puzzle = Puzzle.find(params[:id])
		@targets = @puzzle.targets
		start_puzzle
	end

	def find_character
		@char = Target.find(params[:cid])
		if @char.is_at_coord?(params[:x],params[:y])
			session[:to_find].delete(@char.id)
			calc_score if solved?
			render json: { c: @char.position_data, score: session[:score] }
		else
			render json: "false"
		end
	end

	def start_puzzle
		session[:to_find] = @puzzle.targets.map(&:id)
		session[:start_time] = Time.now
		session[:score] = false
	end

	def solved?
		session[:to_find].empty?
	end

	def calc_score
		session[:score] = (Time.now - session[:start_time].to_time).round(1)
	end

end
