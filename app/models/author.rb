class Author < ApplicationRecord
	def new(first_name, last_name, homepage)
		@first_name = first_name
		@last_name = last_name
		@homepage = homepage
	end

	has_and_belongs_to_many :papers

	validates :first_name, presence: true, length: { minimum: 1 }
  	validates :last_name, presence: true, length: { minimum: 1 }
  	validates :homepage, presence: true, length: { minimum: 1 }
	
	def name
		return self.first_name + ' ' + self.last_name
	end
end
