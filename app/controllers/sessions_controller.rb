class SessionsController  < Devise::SessionsController
 # This controller provides a JSON version of the Devise::SessionsController and
  # is compatible with the use of SimpleTokenAuthentication.
  # See https://github.com/gonzalo-bulnes/simple_token_authentication/issues/27
 skip_before_action :verify_authenticity_token

def create
  respond_to do |format|
	format.html { super }
	format.json { sign_in_json }
  end

end

def destroy
  respond_to do |format|
	format.html { super }
	format.json { sign_out_json }
  end
end

private

def sign_in_json
# Fetch params
   email = params[:session][:email] if params[:session]
   password = params[:session][:password] if params[:session]

   id = User.find_by(email: email).try(:id) if email.presence

  # Validations
  if request.format != :json
	render status: 406, json: { message: 'The request must be JSON.' }
	return
  end

  if email.nil? or password.nil?
	render status: 400, json: { message: 'The request MUST contain the user email and password.' }
	return
  end

  # Authentication
  user = User.find_by(email: email)

  if user
	if user.valid_password? password
  	#user.reset_authentication_token! hay que agregar validacion
  	# Note that the data which should be returned depends heavily of the API client needs.
  	#render status: 200, json: { email: user.email, authentication_token: user.authentication_token, id: id ,name: user.name, lastName: user.lastName }
    render status: 200, json: { email: user.email, id: id ,name: user.name, lastName: user.lastName }
	else
  	render status: 401, json: { message: 'Invalid email or password.' }
	end
  else
	render status: 401, json: { message: 'Invalid email or password.' }
  end
end

def sign_out_json
   # Fetch params
  user = User.find_by(authentication_token: params[:user_token])

  if user.nil?
	render status: 404, json: { message: 'Invalid token.' }
  else
	user.authentication_token = nil
	user.save!
	render status: 204, json: nil
  end
end

end