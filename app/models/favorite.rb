class Favorite < ApplicationRecord
  # Direct associations

  belongs_to :users,
             :class_name => "User"

  belongs_to :movie

  # Indirect associations

  # Validations

end
