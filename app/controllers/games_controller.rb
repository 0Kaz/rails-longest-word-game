require 'open-uri'
require 'json'

class GamesController < ApplicationController
  def new
    @letters = Array.new(10) { ('A'..'Z').to_a.sample }
  end

  def score
    @input = params[:getting_score]
    @output = params[:iteration]
    @result = dico_check?(@input)
    myinput = @input.upcase.split("")
    myoutput = @output.upcase.split("")
    @checking_grid = myinput.all? { |matches| myinput.count(matches) <= myoutput.count(matches) }
  end

  def dico_check?(input)
    url = "https://wagon-dictionary.herokuapp.com/#{input}"
    access_api = open(url).read
    parsing = JSON.parse(access_api)
    parsing["found"]
  end
end
