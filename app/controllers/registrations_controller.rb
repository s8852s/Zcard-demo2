class RegistrationsController < ApplicationController
	def new
		@user = User.new
	end

	def create
		@user = User.new(params_user)
		if @user.save
		  redirect_to root_path, notice: "註冊成功"
		else
			render :new
		end
	end

	private
	def params_user
	  params.require(:user).permit(:email, :password, :password_confirmation, :nickname)
	end
end
