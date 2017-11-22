class Calendar < ApplicationRecord
  validate :rules


      def rules
        if fecha.year < 2017 || (fecha.year == 2017 && fecha.month < 11) || (fecha.year == 2017 && fecha.month == 11 && fecha.day < 22)
          e = " no se puede atrasar la fecha de la creacion del sistema (22/11/2017)"
          errors.add(:fecha, e)
        else
          d = Doctor.all
          yearDif = fecha.year - 2017
          monthDif =  fecha.month - 11
          dayDif = fecha.day - 22

          totalDays = (yearDif * 365) + (monthDif * 31) + dayDif

          totalYears = totalDays / 365
          totalYears = totalYears.floor

          print("La diferencia de años es: " + totalYears.to_s)



          for i in 0..(d.size-1)
            d[i].yearsexperience = d[i].yearsexperience + totalYears
            for j in 0..totalYears
              d[i].salary = d[i].salary + (d[i].salary * 0.10)
            end
            d[i].save
          end

        end
      end

end
