class WizardLinksController < ApplicationController
  before_action :set_wizard_link, only: [:show, :edit, :update, :destroy]

  def index
  end

  def show
  end

  def new
  end

  def edit
  end

  def create
  end

  def update
  end

  def destroy
  end

  private

  def set_wizard_link
    @wizard_link = WizardLink.find(params[:id])
  end

  def wizard_link_params
    params.require(:wizard_link).permit(:name, :path)
  end

end
