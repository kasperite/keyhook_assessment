module AuthenticationHelpers
  def sign_in_user(user, password: "password")
    post session_path, params: { email_address: user.email_address, password: password }
  end

  def sign_in(user, password: "password")
    visit new_session_path

    fill_in "Email address", with: user.email_address
    fill_in "Password", with: password

    click_button "Sign in"
  end
end