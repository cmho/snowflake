Snowflake::App.controllers :story do
  get :index, :map => "/stories" do
    @stories = Story.all(:account_id => session[:account_id])
    render 'story/story_list'
  end

  get :show, :with => :id do
    render 'story/show'
  end

  get :create do
    render 'story/create'
  end

  post :create do
    @story = Story.new(:title => params[:title])
    if @story.save
      redirect "/story/edit/#{@story.id}/1"
    else
      flash[:error] = "There was an error creating your story."
      render :create
    end
  end

  get :edit, :with => [:id, :step] do
    if params[:step] == 1
      render 'story/steps/sentence_summary'
    elsif params[:step] == 2
      render 'story/steps/page_summary'
    elsif params[:step] == 3
      render 'story/steps/character_summaries'
    elsif params[:step] == 4
      render 'story/steps/page_summary'
    elsif params[:step] == 5
      render 'story/steps/character_long_summaries'
    elsif params[:step] == 6
      render 'story/steps/four_page_summary'
    elsif params[:step] == 7
      render 'story/steps/character_charts'
    elsif params[:step] == 8
      render 'story/steps/get_writing'
    else
      render 'story/steps/sentence_summary'
    end
  end

  post :edit, :with => [:id, :step] do
    @story = Story.get(:id => params[:id])
    if params[:step] == 1
      @story.update(:sentence_summary => params[:sentence_summary])
    end

    if @story.save
      # redirect based on action type ("save" or "save and continue")
      if params[:action] == "Save"
        redirect '/story/edit/#{params[:id]/#{params[:step]}'
      end
      redirect '/story/edit/#{params[:id]}/#{params[:step]+1}'
    else
      flash[:error] = "There was an error saving your changes."
      redirect '/story/edit/#{params[:id]/#{params[:step]}'
    end
  end
end
