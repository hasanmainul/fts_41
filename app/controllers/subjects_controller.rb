class SubjectsController < ApplicationController
  load_and_authorize_resource
  def index
    @subjects = Subject.paginate page: params[:page]
  end
end
