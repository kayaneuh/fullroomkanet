class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  # permet d'afficher des messages lorsqu'on met à jour devise
  <p class="notice"><%= notice %></p>
  <p class="alert"><%= alert%></p>
end
