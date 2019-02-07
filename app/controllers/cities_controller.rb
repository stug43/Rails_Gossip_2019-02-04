# frozen_string_literal: true

class CitiesController < ApplicationController
  def show
    @randomizer = ['https://nsa40.casimages.com/img/2019/02/07/mini_190207103839655476.jpg', 'https://nsa40.casimages.com/img/2019/02/07/mini_190207104119410780.jpg', 'https://nsa40.casimages.com/img/2019/02/07/mini_190207104242937775.jpg', 'https://nsa40.casimages.com/img/2019/02/07/mini_190207104356629054.jpg']
    @city = City.find(params[:id])
  end

  def index
    @cities = City.all
  end
end
