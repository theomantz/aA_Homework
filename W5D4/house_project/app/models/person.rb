class Person < ApplicationRecord

    validates :name, presence: true    
    validate :check_name_length
    
    def check_name_length
        unless self.name.length >= 4
            errors['name'] << "name length cannot be shorter than 4 characters"
        end
    end

    belongs_to( :house, {
        class_name: :House,
        foreign_key: :house_id,
        primary_key: :id}
    )
end