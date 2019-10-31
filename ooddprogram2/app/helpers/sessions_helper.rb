module SessionsHelper

  # Logs in the given user.
  def log_in(user)
    session[:user_id] = user.id
  end

  # Returns the current logged-in user (if any).
  def current_user
    if session[:user_id]
      @current_user ||= User.find_by(id: session[:user_id])
    end
  end

  # Returns true if there is any user logged in, do not check it has the current page false otherwise.
  def logged_in?
    !current_user.nil?
  end

  #checked if the logged_in user and its current rold is admin
  def logged_in_admin?
    !current_user.nil? && current_user.role == 1
  end

  #checked if the logged_in user has the page
  def logged_in_user?(user)
    if current_user.nil?
      return false
    end
    if current_user.id == user.id

      return true
    else
      return false
    end
  end

  #checked if the logged_in user is realtor and has the page
  def logged_in_realtor?(realtor)
    if current_user.nil? || current_user.realtor.nil?
      return false
    end
    if current_user.realtor.id == realtor.id && current_user.role == 2
      return true
    else
      return false
    end
  end

  def logged_in_hunter?(hunter)
    if current_user.nil? || current_user.hunter.nil?
      return false
    end
    if current_user.hunter.id == hunter.id && current_user.role == 3

      return true
    else
      return false
    end


  end

  # Logs out the current user.
  def log_out
    session.delete(:user_id)
    @current_user = nil
  end
end
