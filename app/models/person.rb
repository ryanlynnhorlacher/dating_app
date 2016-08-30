class Person < ApplicationRecord
    has_many :hobbies, dependent: :destroy
    has_one :address, dependent: :destroy
    has_many :messages, dependent: :destroy
    validates_presence_of :name, :age, :gender

    @search_results = []
    @@user = ''

    def self.search(name, age, eye_color, hair_color, weight, height)
        @search_results = []
        if name || age || gender || eye_color || hair_color || height || weight
             name_results = Person.all.where(name: name) if name.blank? == false
            if age.blank? == false
                ages = []
                low_age = age.to_i - 5
                for i in 0..10 
                    ages  << "#{low_age + i}"
                end
            end
            age_results =  Person.all.where(age: ages) if age.blank? == false
            eye_color_results = Person.where(eye_color: eye_color) if eye_color.blank? == false
            hair_color_results = Person.where(hair_color: hair_color) if hair_color.blank? == false
            if weight.blank? == false
                weights = []
                low_weight = weight.to_i - 20
                for i in 0..40
                    weights << "#{low_weight + i}"
                end
            end
            weight_results = Person.where(weight: weights) if weight.blank? == false
            if height.blank? == false
                heights = []
                low_height = height.to_i - 4
                for i in 0..8
                    heights << "#{low_height + i}"
                end
            end
            height_results = Person.where(height: heights) if height.blank? == false
            name_results.to_a + age_results.to_a + eye_color_results.to_a + hair_color_results.to_a + weight_results.to_a + height_results.to_a
        end

    end

    def self.hair_color
        ['unspecified', 'blond', 'brown', 'black', 'red', 'grey', 'other']
    end

    def self.eye_color
        ['unspecified', 'blue', 'hazel', 'brown', 'grey', 'green', 'cat']
    end


    def self.gender
        ['female', 'male', 'transgender']
    end

    def self.set_user(id)
        @@user = Person.find(id)
    end

    def self.reset_user
        @@user = ''
    end

    def self.user
        @@user
    end





end
