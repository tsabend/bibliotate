class StoriesController < ApplicationController
  include TxtReaderConcern

  def show
    @story = Story.find(params[:id])
  end

  def new
    @courses = Course.where(user_id:current_user.id)
    @story = Story.new
  end


  def create
    file = params[:story][:text_file]
    if file
      if file.content_type == "application/pdf"
        body = PDF::Reader.open(file.tempfile) do |reader|
          reader.pages.map {|page| page.text }.join(' ')
        end
      else
        body = file.read
      end
    else
      body = params[:story_body]
    end
    @story = Story.from_body(body)
    @story.assign_attributes(story_params)

    if @story.save
      redirect_to @story
    else
      flash[:messages] = @story.errors.messages.first
      redirect_to new_story_path
    end
  end

  def destroy
    Story.destroy(params[:id])
    redirect_to '/'
  end

  def comments_feed
    @story = Story.find(params[:id])
    render partial: 'comments_feed', locals: {story: @story}
  end

  def most_commented
    @story = Story.find(params[:id])
    render partial: 'most_commented'
  end

  def active_users
    @story = Story.find(params[:id])
    render partial: 'active_users'
  end

  private

  def story_params
    params.require(:story).permit([:title, :author, :course_id, :file, :remote_file_url])
  end

end