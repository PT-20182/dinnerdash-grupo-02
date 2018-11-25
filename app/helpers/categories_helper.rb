module CategoriesHelper
	def quantidade(category)
		i = 0 
		@meals.each do | meal |
			if(meal.category_id == category.id)
				i += 1 
			end
		end
		return i
	end
end
