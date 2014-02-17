class UserGroupsController < ApplicationController
	def index
		@user_tab = 'group-list'
		@user_groups = UserGroup.paginate(page: params[:page], :per_page => 20)
	end
	def show
		@user_tab = 'group-list'
		@user_group = UserGroup.find(params[:id])
	end
	def edit
		@user_group = UserGroup.find(params[:id])
	end
	def update
		@user_group = UserGroup.find(params[:id])
		if @user_group.update_attributes(user_group_params)
      			flash[:success] = "User group updated"
			redirect_to user_group_path(@user_group)
	    	else
			flash[:danger] = "User group could not be updated"
	      		render 'edit'
    		end
	end
	def new
		@user_group = UserGroup.new
		@user_tab = 'group-add'
	end
	def create
		@user_group = UserGroup.create(user_group_params)
    	if @user_group.save
    		flash[:success] = "User group created"
      		redirect_to user_group_path(@user_group)
    	else
    		flash[:danger] = "User group could not be created"
      		render 'new'
    	end
	end
	def destroy
		UserGroup.find(params[:id]).destroy
		flash[:success] = "User Group Deleted"
		redirect_to user_groups_path
	end
	
	private
	
	def user_group_params
		params.require(:user_group).permit(:user_group,:group_name)
	end
end
