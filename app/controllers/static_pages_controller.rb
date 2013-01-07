class StaticPagesController < ApplicationController
  def home
  end

  # Produce "secret" sign-in page for testing convenience.
  # Allows for testing of multiple users.
  # Obviously must be removed in the future.
  #
  # Usage (must provide distinct uids)
  # localhost:3000/static_pages/secretsignin/?name=user&uid=0
  #
  # For admin privileges:
  # localhost:3000/static_pages/secretsignin/?name=admin&uid=1
  #
  def secretsignin
      # COMMENT OUT THE FOLLOWING THREE LINES TO REENABLE SECRETSIGNIN
      flash[:error] = 'The secretsignin page has been disabled by kyc.'
      redirect_to :root
      return

      uid = params[:uid]
      name = params[:name]
      user = User.find_by_uid(uid)

      if user
          sign_in user
      else
          params = {name: name, uid: uid}
          user = User.create(params)
          sign_in user
      end
      redirect_to root_url
  end

  def help
  end
end
