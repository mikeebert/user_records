require 'grape-entity'

class UserRecord

  attr_reader :last_name,
              :first_name,
              :favorite_color,
              :date_of_birth

  def initialize(attributes)
    @last_name      = attributes[:last_name]
    @first_name     = attributes[:first_name]
    @favorite_color = attributes[:favorite_color]
    @date_of_birth  = attributes[:date_of_birth]
  end

  def entity
    Entity.new(self)
  end

  class Entity < Grape::Entity
    expose :last_name
    expose :first_name
    expose :favorite_color
    expose :date_of_birth
  end
end
