class NominatesController < ApplicationController
  def new
    @nominate = Nominate.new
  end

  def show
  end

  def create
    @nominate = Nominate.new(nominate_params)
    respond_to do |format|
      if @nominate.save
      format.html { redirect_to teams_path, notice: 'Nominate was successfully updated.' }
      end
    end
  end
  private

  def nominate_params
    params.require(:nominate).permit(:gk,:df1,:df2,:df3,:md1,:dl1,:dl2)
  end
end
