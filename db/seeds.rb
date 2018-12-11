Situation.delete_all
Situation.create(status: "Em andamento")
Situation.create(status: "Pago")
Situation.create(status: "Cancelado")
Situation.create(status: "Confirmado")
User.delete_all