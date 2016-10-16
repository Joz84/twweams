# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

u1 =  User.create(email: "paris1@gmail.com", password: "azerty", first_name: "Elodie", last_name: "LS.", address: nil, complement: nil, zip_code: nil, city: "Paris", country: "FR", charity: nil, gift: nil, travel: nil, birthday: "1983-11-10 10:31:00", latitude: 48.856614, longitude: 2.3522219)
u2 =  User.create(email: "paris2@gmail.com", password: "azerty", first_name: "Yannick", last_name: "SC.", address: nil, complement: nil, zip_code: nil, city: "Paris", country: "FR", charity: nil, gift: nil, travel: nil, birthday: "1983-11-10 10:31:00", latitude: 48.856614, longitude: 2.3522219)
u3 =  User.create(email: "paris3@gmail.com", password: "azerty", first_name: "Charly", last_name: "DV.", address: nil, complement: nil, zip_code: nil, city: "New York", country: "US", charity: nil, gift: nil, travel: nil, birthday: "1983-11-10 10:31:00", latitude: 40.7127837, longitude: -74.0059413)
u4 =  User.create(email: "paris4@gmail.com", password: "azerty", first_name: "Jonathan", last_name: "S.", address: nil, complement: nil, zip_code: nil, city: "Paris", country: "FR", charity: nil, gift: nil, travel: nil, birthday: "1983-11-10 10:31:00", latitude: 48.856614, longitude: 2.3522219)
u5 =  User.create(email: "paris5@gmail.com", password: "azerty", first_name: "Amaury", last_name: "LS.", address: nil, complement: nil, zip_code: nil, city: "Paris", country: "FR", charity: nil, gift: nil, travel: nil, birthday: "1983-11-10 10:31:00", latitude: 48.856614, longitude: 2.3522219)
u6 =  User.create(email: "paris6@gmail.com", password: "azerty", first_name: "Hugo", last_name: "SC.", address: nil, complement: nil, zip_code: nil, city: "Paris", country: "FR", charity: nil, gift: nil, travel: nil, birthday: "1983-11-10 10:31:00", latitude: 48.856614, longitude: 2.3522219)
u7 =  User.create(email: "paris7@gmail.com", password: "azerty", first_name: "Quentin", last_name: "DV.", address: nil, complement: nil, zip_code: nil, city: "Paris", country: "FR", charity: nil, gift: nil, travel: nil, birthday: "1983-11-10 10:31:00", latitude: 48.856614, longitude: 2.3522219)

Attachinary::File.create( attachinariable_type: u1.class.to_s,
                            attachinariable_id: u1.id,
                            scope: "photos",
                            public_id: "qsdhys4bowua0bvbvje4",
                            version:  "1476614038",
                            width: 365,
                            height: 462,
                            format: "jpg",
                            resource_type: "image" )


p = Post.create(content: "Salut la team des Lion du 12 août 1983. Ca vous dirait un birthday géant quelque part ?", user: u1)
p = Post.create(content: "Carrément, j’ai vu que c’est à Toronto qu’on a le plus de membres de notre Twweam.", user: u2)
p = Post.create(content: "Parfait, je prends mes billets de suite. Toulouse Toronto cet été.", user: u3)
p = Post.create(content: "Julia, je suis de Toulouse aussi, on se fait le voyage ensemble ?", user: u4)
p = Post.create(content: "Chaud depuis Toulouse aussi, yeahaaaaaa", user: u5)
p = Post.create(content: "Ca sent la grosse soirée, j’aime ça haha", user: u6)
p = Post.create(content: "Top, on se voit à Toronto les Twweamers", user: u7)

