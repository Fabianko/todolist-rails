class WelcomeController < ApplicationController
    def hello
        @v = 'hola hola esta es una prueba'
        @nombre_perro = Pet.first.name
        @raza_perro = Pet.first.breed
        @credentials = Rails.application.credentials.hello
    end
end