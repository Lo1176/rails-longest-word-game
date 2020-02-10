class GamesController < ApplicationController
  def new
    # o = [('A'..'Z')].map(&:to_a).flatten
    # @letters = (0...50).map { o[rand(o.length)] }.join
    @letters = []
    10.times { @letters << ('A'..'Z').to_a.sample }
  end

  def compare(word, grid)
    word.upcase.split.all? { |letter| grid.split('').count(letter) >= word.upcase.count(letter) }
  end

  def score
    @word = params[:word]
    @grid = params[:grid]
    # raise
    if compare(@word, @grid)
      @phrase = "Your word is #{@word}"
    else
      @phrase = "Sorry, your word #{@word} can’t be built out of the original of #{@grid}"

    end
  end
end
