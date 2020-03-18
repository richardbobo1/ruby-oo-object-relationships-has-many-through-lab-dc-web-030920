require 'pry'

class Doctor 

    attr_reader :name 

    @@all = []

    def initialize(name)
        @name = name

        @@all << self 
    end 


    def self.all
        @@all
    end 

    def appointments
        Appointment.all.select {|appointment| appointment.doctor == self }
    end 

    def new_appointment(patient, date)
        Appointment.new(date, patient, self)
    end 

    def patients 
        my_patients = []
       self.appointments.each {|appointment| my_patients << appointment.patient  }
       my_patients 
      
    end 

end 