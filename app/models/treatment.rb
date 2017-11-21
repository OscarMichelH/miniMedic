class Treatment < ApplicationRecord
  # validates_presence_of :patient_id, :doctor_id, :duration, :medicament, :prescription
  validate :rules

  belongs_to  :doctors, optional: true
  belongs_to  :patients, optional: true

  def rules
      patient = Patient.find_by_id(patient_id)
      doctor =  Doctor.find_by_id(doctor_id)

      if patient.insuranceplan == "PREMIUM" && doctor.speciality == "Radiology"
        errors.add(patient.firstname, "tiene plan PREMIUM y no se le puede asignar un Radilogo")
      end

      if patient.insuranceplan == "BASIC" && (doctor.speciality != "General Medicine" && doctor.speciality != "Obstetrics" && doctor.speciality != "Pediatrics")
        error = "tiene plan BASIC y su cobertura no cubre la especialidad del Doctor " + doctor.firstname
        errors.add(patient.firstname, error)
      end
  end
end
