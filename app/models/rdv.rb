class Rdv < ApplicationRecord
  belongs_to :doctor
  belongs_to :user
end
