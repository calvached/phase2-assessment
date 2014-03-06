def create(params)
  user = User.create(first_name: params[:firstname],
              last_name: params[:lastname],
              email: params[:email],
              birthdate: params[:birthdate])
  user.password = params[:password]
  user.save!
end

def auth(params)
  user = User.find_by_email(params[:email])
  if user.password==(params[:password]) # Bcrypt method call
    session[:user_id] = user.id
    redirect '/all_events'
  else
    "Invalid password"
  end
end
