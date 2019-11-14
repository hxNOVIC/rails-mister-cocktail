class DosesController < ApplicationController
  def new
    @dose = Dose.new
  end

  def create
    @dose = Dose.new(dose_params)
  end

  def destroy

  end

private

  def dose_params
    params.require(:dose).permit(:description, :ingredient_id)
  end

end
