class Room < ApplicationRecord
    validates :name, presence: true
    validates :room_introduction, presence: true
    validates :price, presence: true, numericality: {greater_than_or_equal_to: 1}
    validates :address, presence: true

    belongs_to :user
    has_many :reservations

    mount_uploader :room_img, RoomImgUploader

    def self.all_search(search)
        if search
        Room.where("name LIKE ? or (room_introduction LIKE ?)", "%#{search}%","%#{search}%")
        else
        Room.all
        end
    end
    def self.area_search(search)
        if search
        Room.where("address LIKE ? ", "%#{search}%")
        else
        Room.all
        end
    end
end
