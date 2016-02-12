# Killer facts about triangles AWW YEAH
class Triangle

  attr_reader :side_1, :side_2, :side_3, :angle_1, :angle_2, :angle_3

  def initialize(side_1, side_2, side_3)
    @side_1 = side_1
    @side_2 = side_2
    @side_3 = side_3

    @angle_1 = radians_to_degrees(calculate_radians(side_1, side_2, side_3))
    @angle_2 = radians_to_degrees(calculate_radians(side_2, side_1, side_3))
    @angle_3 = radians_to_degrees(calculate_radians(side_3, side_2, side_1))
  end

  def angles
    [angle_1, angle_2, angle_3]
  end

  def equilateral?
    sides.uniq.length == 1
  end

  def isosceles?
    sides.uniq.length == 2
  end

  def right_triangle?
    angles.include?(90)
  end

  def scalene?
    !(equilateral? || isosceles?)
  end

  def sides
    [side_1, side_2, side_3]
  end

  def to_s
    puts description
    puts 'The angles of this triangle are ' << angles.join(', ')
    puts 'This triangle is also a right triangle!' if right_triangle?
    puts ''
  end

  protected

  def calculate_radians(first_side, second_side, third_side)
    Math.acos((second_side**2 + third_side**2 - first_side**2) / (2.0 * second_side * third_side))
  end

  def description
    if equilateral?
      'This triangle is equilateral!'
    elsif isosceles?
      'This triangle is isosceles! Also, that word is hard to type.'
    elsif scalene?
      'This triangle is scalene and mathematically boring.'
    end
  end

  def radians_to_degrees(radians)
    (radians * 180 / Math::PI).round
  end
end


triangles = [ [5,5,5], [5,12,13] ]
triangles.each do |sides|
  triangle = Triangle.new(*sides)
  triangle.to_s
end
