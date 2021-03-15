class SchedulesController < ApplicationController
  before_action :should_not_display_schedule_counter, { only: %i[new create show edit update destroy] }
  def index
    @schedule = Schedule.all
  end

  def new
    @schedule = Schedule.new
  end

  def create
    @schedule = Schedule.new(schedule_params)
    if @schedule.save
      flash[:notice] = 'スケジュール登録が完了しました'
      redirect_to(schedules_path)
    else
      render(new_schedule_path)
    end
  end

  def show
    @schedule = Schedule.find(params[:id])
  end

  def edit
    @schedule = Schedule.find(params[:id])
  end

  def update
    @schedule = Schedule.find(params[:id])
    if @schedule.update(schedule_params)
      flash[:notice] = 'スケジュールを更新しました'
      redirect_to(schedules_path)
    else
      render('schedules/edit')
    end
  end

  def destroy
    @schedule = Schedule.find(params[:id])
    @schedule.destroy
    flash[:notice] = 'スケジュールを削除しました'
    redirect_to(schedules_path)
  end

  private

  def schedule_params
    params.require(:schedule).permit(:title, :start_date, :end_date, :memo, :is_all_day)
  end
end
