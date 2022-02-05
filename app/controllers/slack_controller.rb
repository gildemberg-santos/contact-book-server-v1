class SlackController < ApplicationController
  def meet
    #   {
    #     "blocks": [
    #     {
    #       "type": "section",
    #       "text": {
    #         "type": "mrkdwn",
    #         "text": "*It's 80 degrees right now.*"
    #       }
    #     },
    #     {
    #       "type": "section",
    #       "text": {
    #         "type": "mrkdwn",
    #         "text": "Partly cloudy today and tomorrow"
    #       }
    #     }
    #   ]
    # }
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
    # render json: params
  end
end
