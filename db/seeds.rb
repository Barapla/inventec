# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# Create a default user
# user = User.create(first_name: "admin", last_name: "admin", email: "l20211825@tectijuana.edu.mx", password: "123123", password_confirmation: "123123")

# user.add_role(:admin)

Institution.create(name: "Instituto Tecnológico de Tijuana", address: "Calzada Tecnológico s/n, Tomas Aquino, 22414 Tijuana, B.C.")
Institution.create(name: "Instituto Tecnológico de Otay", address: "Blvd. Industrial #11101, Parque Industrial Internacional, 22430 Tijuana, B.C.")

# Category.create(name: "Equipo audiovisual", description: "Equipo audiovisual")
# Category.create(name: "Material de oficina", description: "Material de oficina")
# Category.create(name: "Productos de limpieza", description: "Productos de limpieza")
# Category.create(name: "Mobiliario", description: "Mobiliario")
# Category.create(name: "Equipo de cómputo", description: "Equipo de cómputo")
