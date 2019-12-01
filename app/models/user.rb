class User < ApplicationRecord
    has_many :daily_intakes, dependent: :destroy
    has_many :foods, through: :daily_intakes

    has_secure_password

    validates :username, uniqueness: true

   
    def total_servings
        total_servings = 0
         self.daily_intakes.map do |daily_intake|
            total_servings += daily_intake.serving
         end
         return total_servings
    end



    def total_calories
        
        total_calorie = 0
         self.foods.map do |food|
            total_calorie += food.calorie
         end
         return total_calorie
    end

    def total_fat
        
        total_fat = 0
         self.foods.map do |food|
            total_fat += food.fat
         end
         return total_fat.round(2)
    end

    def total_carbs
        total_carbs = 0
         self.foods.map do |food|
            total_carbs += food.carbs
         end
         return total_carbs.round(2)
    end

    def total_protein
        total_protein = 0
         self.foods.map do |food|
            total_protein += food.protein
         end
         return total_protein.round(2)
    end

    def total_sugar
        total_sugar = 0
         self.foods.map do |food|
            total_sugar += food.sugar
         end
         return total_sugar.round(2)
    end
end
