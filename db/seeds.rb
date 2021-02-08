# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?
Event.create(name: 'Matrimonio de Ana y Kilo', description: 'Se casan mis viejitos', user_id: 1, created_at: "2021-02-08 18:55:25", updated_at: "2021-02-08 18:55:25")
List.create(id: 1, name: 'Lista de Ana', description:'Lista de deseos de Ana', event_id: 1, created_at: "2021-02-08 18:56:01", updated_at: "2021-02-08 18:56:01")
List.create(id: 2, name: 'Lista de Kilo', description:'Lista de deseos de Kilo', event_id: 1, created_at: "2021-02-08 18:56:01", updated_at: "2021-02-08 18:56:01")
Item.create(id: 1, name: "Licuadora Oster Reversible Silver ", price: 69990.0, url: "https://www.falabella.com/falabella-cl/product/812...", list_id: 2, created_at: "2021-02-08 18:57:46", updated_at: "2021-02-08 18:57:46", img_url: 'https://falabella.scene7.com/is/image/Falabella/8123796_1?q=i?wid=800&hei=800&qlt=70')
Item.create(id: 2, name: "Cocina a Gas 4 Quemadores Andes60TX3 ", price: 229990.0, url: "https://www.falabella.com/falabella-cl/product/620...", list_id: 2, created_at: "2021-02-08 19:11:06", updated_at: "2021-02-08 19:11:06", img_url: "https://falabella.scene7.com/is/image/Falabella/6203495_1?q=i?wid=800&hei=800&qlt=70")
Item.create(id: 3, name: "Consola Ps4 Pro 1 Tb  Call Of Duty Mw ", price: 699990.0, url: "https://www.falabella.com/falabella-cl/product/108...", list_id: 1, created_at: "2021-02-08 19:13:41", updated_at: "2021-02-08 19:13:41", img_url: "https://falabella.scene7.com/is/image/Falabella/10868333_1?q=i?wid=800&hei=800&qlt=70")