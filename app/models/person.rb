class Person < ApplicationRecord
  actable

  validates_presence_of :firstname, :lastname, :dob, :gender

  def info
    "#{firstname} $#{lastname} $#{dob} $#{gender}"
  end
end
