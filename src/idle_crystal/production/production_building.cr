require "../resource_pack"

class IdleCrystal::Production::ProductionBuilding
  def initialize(h : YAML::Any)
    @name = h["name"]
    @production = h["production"].to_s.to_i
    @cost = h["cost"]
    @coeff = h["coeff"].to_s.to_f
    @amount = 0 as Int32
    @build_key = h["build_key"].to_s[0]
  end

  def cost_for_unit(unit)
    rp = IdleCrystal::ResourcePack.new
    @cost.keys.each do |k|
      rp.volume(k, @cost[k].to_s.to_f ** @coeff)
    end

    return rp
  end

  getter :name, :amount, :build_key
end
