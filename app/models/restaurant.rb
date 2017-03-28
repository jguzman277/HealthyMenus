class Restaurant < ApplicationRecord
	mount_uploader :image, ImageUploader

	has_many :reviews

	validates :name, :address, :phone, :website, :image, presence: true
	validates :phone, format: {with: /\A\(\d{3}\)\s\d{3}-\d{4}\z/, message: "must be in the format: (555) 332-1122"}
	validates :website, format: {with: /\Ahttps?:\/\/.*\z/, message: "must star with http:// or https://"}
	validates :address, format: {with: /\A\d+[^,]+,[^,]+, [A-Z]{2} \d{5}\z/, message: "must be in the format 350 Fifth Avenue, New York, NY 10010"}
end
