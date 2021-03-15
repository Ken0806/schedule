require 'date'
class ApplicationController < ActionController::Base
  before_action :get_current_date
  before_action :get_total_num_of_schedule
  before_action :should_display_schedule_counter
  def get_current_date
    current_date = Date.today
    formatted_current_date = current_date.strftime('%Y年%m月%d日')
    @current_date_for_footer = "現在の日時 : #{formatted_current_date}"
  end

  def get_total_num_of_schedule
    total_num_of_schedule = Schedule.count
    @total_num_of_schedule_for_footer = "スケジュール合計 : #{total_num_of_schedule}"
  end

  def should_display_schedule_counter
    @display_schedule_counter = true
  end

  def should_not_display_schedule_counter
    @display_schedule_counter = false
  end

end
