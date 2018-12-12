Situation.delete_all
Situation.create(status: "Em andamento")
Situation.create(status: "Pago")
Situation.create(status: "Cancelado")
Situation.create(status: "Confirmado")
User.delete_all
User.create! do |admin|
	admin.email = 'admin@gmail.com'
	admin.password = '123456'
	admin.password_confirmation = '123456'
	admin.admin = true
end
Category.delete_all
Category.create(name: "Massas")
m = Meal.create(
	name: "pizza de calabresa",
	price: 19.99,
	description: "crocante e cremosa",
	available: true,
	category_id: 1
)
m.image.attach(io: File.open('app/assets/images/cheese-crust-delicious-774487.jpg'), filename: 'file.jpg')