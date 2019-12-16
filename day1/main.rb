class FlyModule
  attr_reader :mass

  def initialize(mass)
    @mass = mass.to_i
  end

  def fuel
    (mass / 3).floor - 2
  end
end

def recursive_mass(mass)
  fuel = FlyModule.new(mass.to_i).fuel

  if fuel > 0
    mass_to_add = recursive_mass(fuel)
    fuel += mass_to_add if mass_to_add > 0
  end

  fuel
end

def main(valores = nil)
  file_data = valores || File.read("part1.txt").split

  p file_data.map { |mass| recursive_mass(mass) }.reduce(:+)

end

main()

