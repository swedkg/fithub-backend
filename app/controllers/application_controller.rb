class ApplicationController < ActionController::Base

  protect_from_forgery prepend: true
  protect_from_forgery unless: -> { request.format.json? }

end
