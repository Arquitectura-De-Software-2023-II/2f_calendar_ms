# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Client.create(user_id: "1193541561",status: 0)
Pet.create(pet_id: "666",name: "Cerberus",breed: "Dummy")
Day.create(cod: 1,name: "Monday",available: 0)
Event.create(cod: 1,title: "Evento test",description: "Este es un evento dummy",begin: "2023-09-11 00:46:19.228642",end: "2023-09-11 00:46:19.228642",client_ID: "123456789",creator_ID: "987654321",event_type: "Dummy",editable: 1)

Day.create(cod: 1,name: "Tuesday",available: 0)
Pet.create(pet_id: "777",name: "Fefnir",breed: "Dummy")

