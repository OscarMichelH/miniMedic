class Patient < ApplicationRecord
  acts_as :person

  has_many :treatments
end
