class Reservation < ApplicationRecord
    validates  :check_in_date, presence:true
    validates  :check_out_date, presence:true
    validates  :people_number, presence:true, numericality: {greater_than_or_equal_to: 1}
    validate :check_in_check
    validate :check_in_out_check

    belongs_to :user
    belongs_to :room

    def check_in_check
        if self.check_in_date > self.check_out_date
        end
    end

    def check_in_out_check
        if self.check_in_date < Time.now
        end
    end



end
