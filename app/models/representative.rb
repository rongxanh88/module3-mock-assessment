class Representative < ApplicationRecord
  validates :repid, :name, :role, :party, :seniority, :district, :state, presence: true
  validates :repid, :name, :district, uniqueness: true

  def self.build_representatives_for(state)
    service = HouseMemberService.new(state)
    representatives = service.house_members

    representatives.each do |representative|
      rep = Representative.find_or_create_by(repid: representative[:id])
      rep.name = representative[:name]
      rep.role = representative[:role]
      rep.party = representative[:party]
      rep.seniority = representative[:seniority].to_i
      rep.district = representative[:district].to_i
      rep.state = state
      rep.save
    end
  end

  def self.get_representatives_for(state)
    where(state: state).order("seniority DESC")
  end
end
