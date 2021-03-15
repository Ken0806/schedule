class Schedule < ApplicationRecord
  validates :title, { presence: true, length: { maximum: 20 } }
  validates :start_date, { presence: true }
  validates :end_date, { presence: true }
  validates :memo, { length: { maximum: 500 } }
  validate :end_date_cannot_over_start_date

  def end_date_cannot_over_start_date
    errors.add(:end_date, 'は開始日以降の日程を設定してください') if start_date && end_date && (start_date > end_date)
  end
end
