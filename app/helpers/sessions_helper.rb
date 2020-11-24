module SessionsHelper
    def current_user
      if session[:userprof]
        @userprof ||= User.find_by(id: session[:userprof])
      else
        nil
      end
    end
end
