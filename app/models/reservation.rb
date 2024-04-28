class Reservation < ApplicationRecord
    validates  :check_in_date, presence:true
    validates  :check_out_date, presence:true
    validates  :people_number, presence:true, numericality: {greater_than_or_equal_to: 1}
    validate   :check_in_check
    validate   :check_in_out_check

    

    belongs_to :user
    belongs_to :room

    require 'active_support'
    require 'active_support/core_ext'

    def check_in_check
        if self.check_in_date.present? && self.check_in_date < Date.today
            errors.add(:check_in_date, ": 過去の日付は使えません")
        end
    end

    def check_in_out_check
        if self.check_in_date.present? && self.check_out_date.present? && self.check_in_date > self.check_out_date
            errors.add(:check_in_date, ": チェックアウト日より後の日に設定することはできません")
        end
    end
  



end
