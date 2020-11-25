module SessionsHelper
    def current_user
      if session[:userprof]
        @userprof ||= User.find_by(id: session[:userprof])
      else
        nil
      end
    end

    def user_signed_in?
      #跟current_user的差別是回傳的東西不一樣  user_sign_in?只回傳T or F
      if current_user
        return true
      else
        return false
      end

    end

  
end
