class RegistrationsController < Devise::RegistrationsController
    # Disable CSRF protection
    skip_before_action :verify_authenticity_token

    # Be sure to enable JSON.
    respond_to :html, :json

  def create
    build_resource(sign_up_params)

    resource.save
    render_resource(resource)
  end

end