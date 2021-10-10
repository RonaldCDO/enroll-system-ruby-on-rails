class Student < ApplicationRecord
    # has_one :teachers
    validates :name, :registration_number, :email, :born_date, presence: true
    validates :email, :registration_number, uniqueness: true
    validates_length_of :registration_number, is: 9
    validates_date :born_date, before: lambda {15.years.ago}
end
