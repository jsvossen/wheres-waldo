class ScoresController < ApplicationController


	def index
		@scores = Puzzle.find(params[:id]).scores
	end

	def create
		@puzzle = Puzzle.find(params[:puzzle_id])
		@score  = @puzzle.scores.build(score_params)
		@score.update_attributes(seconds: session[:score])
		if @score.save
			session[:name] = @score.name
			puts "score created!"
			puts @score
		else
			errors = @score.errors.full_messages.join(". ")
			puts "Error: #{errors}"
		end
	end

	def post_score
		@puzzle = Puzzle.find(params[:id])
		puts @puzzle.is_high_score?(session[:score])
		if @puzzle.is_high_score?(session[:score])
			session[:name] ||= "Anonymous"
			@score = @puzzle.scores.build(name: session[:name], seconds: session[:score])
			respond_to do |format|
		        format.js
		    end
		else
			render :nothing => true
		end
	end

	private

		def score_params
			params.require(:score).permit(:name)
		end


end
