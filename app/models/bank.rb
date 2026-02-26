class Bank < ApplicationRecord
  belongs_to :employee

  validates :name, presence: true
  validates :account, presence: true, uniqueness: true
  validates :agency, presence: true, uniqueness: true
end
