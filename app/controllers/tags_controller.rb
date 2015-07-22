class TagsController < ApplicationController
  def index
    @tags = Tag.all
  end

  def show
    @tag = Tag.find params[:id]
  end

  def create
    @tag = Tag.create(tag_params)
    redirect_to tags_path
  end

  def new
    @tag = Tag.new
    @tags_display = Tag.all
  end

  def destroy
    creature_tag = Tag.find(params[:id])
    if creature_tag.creatures.count !=0
      flash[:danger] = "Cannot delete this tag because there are #{creature_tag.creatures.count} creatures using it"
      redirect_to tags_path
    else
      creature_tag.delete
    redirect_to tags_path
    end
  end

  private

  def tag_params
    params.require(:tag).permit(:name)
  end

#  tags#new
# Add tag form
#  tags#create
# creates a tag
#  tag#destroy
# deletes a tag
# Check if tag is in use
# and display error to user like:
# "cannot delete this tag because
# there are X creatures using it"

end
