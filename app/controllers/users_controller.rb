class UsersController < ApplicationController

	def new

		@user = User.new

	end

	def create
		# byebug
		@user = User.new(user_params)
		if @user.save
			session[:user_id] = @user.id
			redirect_to root_url, notice: "Thank you for signing up!"
		else
			render "new"


		end
	end


	def show 

		@user = User.find(params[:id])

		@articles = Article.where(user_id: @user.id)

	end

	def edit
    	@user = User.find(params[:id])
  	end

  def update
    	@user = User.find(params[:id])
    	if @user.update(user_params)
      		redirect_to user_path(@user)
    	else 
      		render "edit"
    	end
  end


private 

  	def user_params 
  		params.require(:user).permit(:first_name, :last_name, :email, :password, :avatar)
  	end

end



