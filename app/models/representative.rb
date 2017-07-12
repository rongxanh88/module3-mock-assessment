class Representative < ApplicationRecord
  validates :repid, :name, :role, :party, :seniority, :district, presence: true
  validates :repid, :name, :district, uniqueness: true
end
