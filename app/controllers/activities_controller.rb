class ActivitiesController < ApplicationController

  hobo_model_controller

  auto_actions :all
  
  def show
    hobo_show do |format|
      format.json {
        render :text => @activity.to_hash.to_json
      }
      format.yaml {
        render :text => @activity.to_hash.to_yaml
      }
      format.html {}
    end
  end

  def preview
    File.open "#{Rails.root}/public/static/smartgraphs/en/5a2301d099b8d537c51560051dd2bc99eb4b582f/index.html" do |file|
      render :text => file.read
    end
  end

end
