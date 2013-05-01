Snowflake.controllers :story do
  get :index do
    erb :story_list
  end

  get :show do
    erb :show_snowflake
  end

  get :create do
    erb :start_story
  end

  post :create do
    @story = Story.new(params[:story])
  end

  get :edit, :with => [:id, :step] do
    if params[:step] == 1
      erb :sentence_summary
    elsif params[:step] == 2
      erb :page_summary
    elsif params[:step] == 3
      erb :character_summaries
    elsif params[:step] == 4
      erb :page_summary
    elsif params[:step] == 5
      erb :character_long_summaries
    elsif params[:step] == 6
      erb :four_page_summary
    elsif params[:step] == 7
      erb :character_charts
    elsif params[:step] == 8
      erb :get_writing
    else
      erb :sentence_summary
    end
  end

  post :edit, :with => [:id, :step] do
    if params[:step] == 1
      # idek
    end

    # redirect based on action type ("save" or "save and continue")
    if params[:action] == "Save"
      redirect '/story/edit/#{params[:id]/#{params[:step]}'
    end
    redirect '/story/edit/#{params[:id]}/#{params[:step]+1}'
  end
end