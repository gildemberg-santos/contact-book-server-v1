class SlackController < ApplicationController
  def meet
    object = { blocks: [
      {
        type: 'section',
        text: {
          type: 'mrkdwn',
          text: "*It's 80 degrees right now.*"
        }
      },
      {
        type: 'section',
        text: {
          type: 'mrkdwn',
          text: 'Partly cloudy today and tomorrow'
        }
      }
    ] }
    render json: object
  end
end
