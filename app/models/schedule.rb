require 'date'

class Schedule < ApplicationRecord
  validates :title, { presence: true, length: { maximum: 20 } }
  validates :start_date, { presence: true }
  validates :end_date, { presence: true }
  validates :memo, { length: { maximum: 500 } }
  validate :end_date_cannot_over_start_date
  validate :end_date_must_over_today

  def end_date_cannot_over_start_date
    errors.add(:end_date, 'は開始日以降の日程を設定してください') if start_date && end_date && (start_date > end_date)
  end

  def end_date_must_over_today
    errors.add(:end_date, 'は今日以降の日付で選択してください') if  end_date && (end_date < Date.today)
  end
end
