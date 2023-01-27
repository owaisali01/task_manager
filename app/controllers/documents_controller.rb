class DocumentsController < ApplicationController
  before_action :set_document_object, only: %i[show edit update delete]

  def index
    @documents = Document.all
  end

  def new
    @document = Document.new
  end

  def show; end

  def create
    @document = Document.new(document_params)
    respond_to do |format|
      if @document.save
        format.html { redirect_to request.referer }
        format.js
      else
        render :new
      end
    end
  end

  private

  def set_document_object
    @document = Document.find(params[:id])
  end

  def document_params
    params.require(:document).permit(:file, :task_id)
  end
end
