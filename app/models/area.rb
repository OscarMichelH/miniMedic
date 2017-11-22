class Area < ApplicationRecord

  validate :rules
  belongs_to  :doctors, optional: true

  def rules
    doctor = Doctor.find_by_id(leader)

    arealeaded = Area.find_by_leader(leader)


    # Si no hay doctor
    if doctor == nil
      errors.add(:leader,"error")
    elsif name != doctor.speciality
      error = "no puede ser asignado a esta area porque su especilidad es " + doctor.speciality.downcase
      errors.add(doctor.firstname, error)
    elsif arealeaded != nil
      errorLeaderExits = "ya es lider de otra area"
      errors.add(doctor.firstname, errorLeaderExits)
    end
  end

  def name_with_location
   "#{name} - #{location}"
  end

end
