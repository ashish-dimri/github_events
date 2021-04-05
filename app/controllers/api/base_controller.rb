class Api::BaseController < ApplicationController
	rescue_from ActiveRecord::RecordNotFound, with: :not_found
	rescue_from ActiveRecord::RecordInvalid, with: :unprocessable_entity

	def json_response(object, status = :ok)
    render json: object, status: status
  end

  def not_found
    render json: {
      'errors': [
        {
          'status': '404',
          'title': 'Not Found'
        }
      ]
    }, status: 404
  end

  def unprocessable_entity
  	render json: {
      'errors': [
        {
          'status': '422',
          'title': 'Unprocessable Entity'
        }
      ]
    }, status: 422
  end

  def json_response(object, status = :ok)
    render json: object, status: status
  end
end
