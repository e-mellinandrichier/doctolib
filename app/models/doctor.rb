class Doctor < ApplicationRecord
  has_many :rdvs, dependent: :destroy
  has_many :users, through: :rdvs
end
