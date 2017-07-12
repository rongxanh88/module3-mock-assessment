class Representative < ApplicationRecord
  validates :repid, :name, :role, :party, :seniority, :district, :state, presence: true
  validates :repid, :name, :district, uniqueness: true
end
