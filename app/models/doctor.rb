class Doctor < ApplicationRecord
  acts_as :person
  validate :rules

  belongs_to  :areas, optional: true
  has_one :areas
  has_many :treatments

  def rules
    #Sacar el area a la que pertenece ese doctor
    doctorOld = Doctor.find_by_id(id)

    #Si el doctor ya existia
    if(doctorOld != nil)
      area = Area.find_by_id(doctorOld.area_id) #Radilogy zona 1
      arealeaded =Area.find_by_leader(id)
      t = true

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
          if d[i].area_id == area.id && d[i].id != area.leader
            area.leader = d[i].id
            t = false
            break
          end
        end

        if t
          e = "no se puede cambiar su porque no hay suplente"
          errors.add(firstname, e)
        end

        area.save
      end

    #El doctor es nuevo
    else
      area = Area.find_by_id(id)
      if area.name != speciality
        error = "no puede ser asignada como area porque la especialidad seleccionada del doctor es " + speciality.downcase
        errors.add(area.name, error)
      end
    end


  end

  def name_with_speciality
   "#{firstname} - #{speciality}"
  end
end
