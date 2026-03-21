module AuthenticationHelpers
  def sign_in_user(user, password: "password")
    post session_path, params: { email_address: user.email_address, password: password }
  end
end