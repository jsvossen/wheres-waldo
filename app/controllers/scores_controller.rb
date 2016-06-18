class ScoresController < ApplicationController


	def index
		@puzzle = Puzzle.find(params[:puzzle_id])
		@scores = @puzzle.scores.by_best_time
	end

	def create
		@puzzle = Puzzle.find(params[:puzzle_id])
		@score  = @puzzle.scores.build(score_params)
		@score.update_attributes(seconds: session[:score])
		if @score.save
			session[:name] = @score.name
			redirect_to puzzle_scores_path(@puzzle)
		else
			flash[:danger] = @score.errors.full_messages.join(". ")
			redirect_to puzzle_scores_path(@puzzle)
		end
	end

	def post_score
		@puzzle = Puzzle.find(params[:id])
		if @puzzle.is_high_score?(session[:score])
			session[:name] ||= "Anonymous"
			@score = @puzzle.scores.build(name: session[:name], seconds: session[:score])
			render 'post_score'
		else
			render 'show_score'
		end
	end

	private

		def score_params
			params.require(:score).permit(:name)
		end


end
