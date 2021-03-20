class Task < ApplicationRecord
    validates :title, presence: true
    validates :start_date, presence: true
    validates :complete_date, presence: true
    validate :start_after_today
    validate :complete_after_start
    
  def start_after_today
    return if start_date.blank?
    errors.add(:start_date, "は今日以降の日付を入力してください") if start_date < Date.today
  end

  def complete_after_start
    return if complete_date.blank? || start_date.blank?
    errors.add(:complete_date, "は開始日以降の日付を入力してください") if complete_date < start_date
  end

end
