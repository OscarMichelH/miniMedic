class Doctor < ApplicationRecord
  acts_as :person
  validate :rules

  belongs_to  :areas, optional: true
  has_one :areas
  has_many :treatments

  def rules
    #Sacar el area a la que pertenece ese doctor
    area = Area.find_by_id(area_id) #Radilogy zona 1

    arealeaded =Area.find_by_leader(id)
    t = false

    if area == nil
      errors.add(:area_id, "error")
    elsif area.name != speciality
      error = "no puede ser asignada como area porque la especialidad seleccionada del doctor es " + speciality.downcase
      errors.add(area.name, error)
    elsif arealeaded == nil
      errorleaded = "no se puede cambiar su area porque no es lider"
      errors.add(area.name, errorleaded)
    elsif arealeaded != nil
      d = Doctor.all

      for i in 0..(d.size-1)
        if d[i].area_id == area_id && d[i].id != area.leader
          area.leader = d[i].id
          t = true
          area.save
          break
        end
      end

      if t
        e = "no se puede cambiar su porque no hay suplente"
        errors.add(firstname, e)
      end

    end

  end

  def name_with_speciality
   "#{firstname} - #{speciality}"
  end
end
