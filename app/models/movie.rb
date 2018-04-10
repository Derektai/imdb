class Movie < ApplicationRecord
  # Direct associations

  belongs_to :director

  has_many   :favorites,
             :dependent => :destroy

  has_many   :castings,
             :dependent => :destroy

  # Indirect associations

  has_many   :actors,
             :through => :castings,
             :source => :actor

  # Validations

  validates :title, :presence => true

end
