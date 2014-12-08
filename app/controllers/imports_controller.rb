class ImportsController < ApplicationController
  def create
    journalist_importer = JournalistImporter.new(params[:file], current_user)
    journalist_importer.import
    redirect_to root_path
  end
end
