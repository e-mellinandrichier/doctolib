class RdvsController < ApplicationController
  before_action :set_rdv, only: [:show, :edit, :update, :destroy]
  # before_action :set_doctor, only: [:new, :create]

  def index
    @rdvs = Rdv.all
  end

  def show
    @rdv = Rdv.find(params[:id])
  end

  def new
    @rdv = Rdv.new # Need to instantiate the form_with
  end

  def create
    @rdv = Rdv.new(rdv_params)
    @rdv.user = current_user
    @rdv.save
    redirect_to rdvs_path
  end

  def edit
    @rdv = Rdv.find(params[:id])
  end

  def update
    @rdv = Rdv.find(params[:id])
    @rdv.update(rdv_params)
    redirect_to rdv_path(@rdv)
  end

  def destroy
    @rdv = Rdv.find(params[:id])
    @rdv.destroy
    redirect_to rdvs_path, status: :see_other
  end

  private

  def rdv_params
    params.require(:rdv).permit(:date, :doctor_id, :user_id)
  end

  def set_rdv
    @rdv = Rdv.find(params[:id])
  end

  # def set_doctor
  #   @doctor = Doctor.find(params[:id])
  # end
end
