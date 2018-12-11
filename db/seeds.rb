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