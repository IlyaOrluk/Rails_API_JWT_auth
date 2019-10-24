class SessionsController < Devise::SessionsController
  respond_to :json

  def current_token
    request.env['warden-jwt_auth.token']
  end

  private

  def respond_with(resource, _opts = {})
    render json: {
      user: current_user,
      JWT: current_token
    }
  end

  def respond_to_on_destroy
    head :no_content
  end
end