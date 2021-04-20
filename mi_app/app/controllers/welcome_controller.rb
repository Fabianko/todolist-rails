class WelcomeController < ApplicationController
    def hello
        @v = 'hola hola esta es una prueba'
        @nombre_perro = Pet.first.name
        @raza_perro = Pet.first.breed
    end
end