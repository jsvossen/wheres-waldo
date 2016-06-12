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
			render json: @char.position_data
			session[:to_find].delete(@char.id)
			get_score if solved?
		else
			render json: "false"
		end
	end

	def start_puzzle
		session[:to_find] = @puzzle.targets.map(&:id)
		session[:start_time] = Time.now
	end

	def solved?
		session[:to_find].empty?
	end

	def get_score
		session[:finish_time] = Time.now
		puts session[:finish_time].to_time - session[:start_time].to_time
	end

end
