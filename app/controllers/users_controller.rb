class UsersController < ApplicationController
  #require 'oauth2'

  CLIENT_ID = "336184733554-fpkrdqv8iis7hfifcoq6rq2b4ln3kn4c.apps.googleusercontent.com"
  CLIENT_SECRET = "_MYiDzimywN_PUPp-2VyWuXM"

  def client
    client ||= OAuth2::Client.new(CLIENT_ID, CLIENT_SECRET, {
              :site => 'https://accounts.google.com',
              :authorize_url => "/o/oauth2/auth",
              :token_url => "/o/oauth2/token"
            })
  end

  def index
  end

  def student_auth
    redirect_to client.auth_code.authorize_url(:redirect_uri => 'http://localhost:3000/callback',:scope => 'https://www.googleapis.com/auth/userinfo.email',:access_type => "offline")
  end

  def student_callback
    #Gets the Access Token for the User Signed In and Stores it
    access_token = client.auth_code.get_token(params[:code], :redirect_uri => 'http://localhost:3000/callback')

    #Stores all the Information that Google Sends Back In Variable For Later Use
    response = access_token.get('https://www.googleapis.com/oauth2/v1/userinfo?alt=json')

    #Gets the Info Specifically About the signed in User
    user_info = JSON.parse(response.body)
    #binding.pry

    #Using the Information Google Sent Back Look for or create the User
    @user = User.find_or_create_by(name: user_info["name"])
    @user.update(email: user_info["email"], photo: user_info["picture"])

    session[:current_user] = @user.id

    render :index
  end

  def teacher_auth
    redirect_to client.auth_code.authorize_url(:redirect_uri => 'http://localhost:3000/callback',:scope => 'https://www.googleapis.com/auth/userinfo.email',:access_type => "offline")
  end

  def teacher_callback
    #Gets the Access Token for the User Signed In and Stores it
    access_token = client.auth_code.get_token(params[:code], :redirect_uri => 'http://localhost:3000/callback')

    #Stores all the Information that Google Sends Back In Variable For Later Use
    response = access_token.get('https://www.googleapis.com/oauth2/v1/userinfo?alt=json')

    #Gets the Info Specifically About the signed in User
    user_info = JSON.parse(response.body)
    #binding.pry

    #Using the Information Google Sent Back Look for or create the User
    @user = User.find_or_create_by(name: user_info["name"], role: "teacher")
    @user.update(email: user_info["email"], photo: user_info["picture"])

    session[:current_user] = @user.id

    render :index
  end

end
