class Admin::LabelsController < ApplicationController
  def index
    @labels = Label.all
    @label = Label.new
  end
  
  def create
    @label = Label.new(label_params)
    @label.save
    redirect_to admin_labels_path
  end
  
  def show
    @label = Label.find_by_id(params[:id])
    @users = User.all
  end
  
  def edit
    
  end
  
  def update
    
  end
  
  def delete
    
  end
  
  def set_label
    @users = User.where(id: params[:user_ids])
    label = Label.find(params[:label_id])
    
    @users.each do | user |
      unless LabelSet.exists?(user_id: user.id, label_id: label.id)
        label_set = label.label_sets.build
        label_set.user_id = user.id
        label_set.save
      end
    end
    redirect_to admin_labels_path
  end
  
private
  def label_params
    params.require(:label).permit(:name)
  end
end
