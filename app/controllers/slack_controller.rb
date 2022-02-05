class SlackController < ApplicationController
  def meet
    render json: params
  end
end
