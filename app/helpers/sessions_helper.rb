module SessionsHelper
def logged_in?
  session[:username].present?
end

def logged_in_user
  User.find_by(username:session[:username])
end

end
