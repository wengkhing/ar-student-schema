require_relative '../../db/config'

class Student < ActiveRecord::Base
# implement your Student model here
validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }
validates :phone, format: { with: /\(\d{3}\) / on: :create}
validates :email, uniqueness: true
validates :age numericality: {greater_than_equal_to: 5}
# validates :birthday, numericality: 
	def name
		"#{first_name} #{last_name}"
	end

	def age
		Date.today.year - birthday.year
	end
end