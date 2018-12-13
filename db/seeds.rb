Situation.delete_all
Situation.create(status: "Em andamento")
Situation.create(status: "Confirmado")
Situation.create(status: "Cancelado")
Situation.create(status: "Concluido")
User.delete_all
User.create! do |admin|
	admin.name = "Administrador"
	admin.email = 'admin@gmail.com'
	admin.password = '123456'
	admin.password_confirmation = '123456'
	admin.admin = true
end
Category.delete_all
Category.create(name: "Macarrões")
Category.create(name: "Pizzas")
m = Meal.create(
	name: "pizza de calabresa",
	price: 19.99,
	description: "crocante e cremosa",
	available: true,
	category_id: 2
)
m.image.attach(io: File.open('app/assets/images/cheese-crust-delicious-774487.jpg'), filename: 'file.jpg')
m = Meal.create(
	name: "macarrão com camarão",
	price: 14.99,
	description: "cremoso",
	available: true,
	category_id: 1
)
m.image.attach(io: File.open('app/assets/images/basil-blur-close-up-726000.jpg'), filename: 'file1.jpg')
m = Meal.create(
	name: "macarrão com banana frita",
	price: 14.99,
	description: "gostoso",
	available: true,
	category_id: 1
)
m.image.attach(io: File.open('app/assets/images/basil-dinner-dish-64208.jpg'), filename: 'file1.jpg')
m = Meal.create(
	name: "macarrão com carne moida",
	price: 14.99,
	description: "gostoso",
	available: true,
	category_id: 1
)
m.image.attach(io: File.open('app/assets/images/basil-dinner-food-8500.jpg'), filename: 'file1.jpg')
m = Meal.create(
	name: "macarrão com frutos do mar",
	price: 14.99,
	description: "gostoso",
	available: true,
	category_id: 1
)
m.image.attach(io: File.open('app/assets/images/bivalve-clam-cooking-921374.jpg'), filename: 'file1.jpg')
m = Meal.create(
	name: "macarrão diferenciado",
	price: 14.99,
	description: "gostoso",
	available: true,
	category_id: 1
)
m.image.attach(io: File.open('app/assets/images/bowl-cuisine-delicious-803963.jpg'), filename: 'file1.jpg')
m = Meal.create(
	name: "macarrão fitness",
	price: 14.99,
	description: "gostoso",
	available: true,
	category_id: 1
)
m.image.attach(io: File.open('app/assets/images/bowl-food-healthy-9243.jpg'), filename: 'file1.jpg')
m = Meal.create(
	name: "pizza moda da casa",
	price: 19.99,
	description: "gostoso",
	available: true,
	category_id: 2
)
m.image.attach(io: File.open('app/assets/images/cheese-circle-close-up-803290.jpg'), filename: 'file1.jpg')
m = Meal.create(
	name: "pizza fitness",
	price: 19.99,
	description: "gostoso",
	available: true,
	category_id: 2
)
m.image.attach(io: File.open('app/assets/images/cheese-cooking-crispy-263041.jpg'), filename: 'file1.jpg')

