class Teacher < ApplicationRecord
    has_many :students, dependent: :destroy
    has_one :languages, dependent: :destroy
    validates :name, :email, :born_date, presence: true
    validates :email, uniqueness: true
    validates_date :born_date, before: lambda {15.years.ago}
end
