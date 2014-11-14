class Triangle
  attr_accessor :side1, :side2, :side3

  def initialize(side1, side2, side3)
    @side1, @side2, @side3 = side1, side2, side3
    @type = type_of_triangle
  end

  def type_of_triangle
    case
      when equilateral? then :equilateral
      when isosceles? then :isosceles
      when scalene? then :scalene
    end
  end

  def equilateral?
    side1 == side2 && side2 == side3
  end

  def isosceles?
    [side1, side2, side3].uniq.length == 2
  end

  def scalene?
    !(equilateral? || isosceles?)
  end

  def which_triangle
    output = {
      equilateral: 'This triangle is equilateral!',
      isosceles: 'This triangle is isosceles! Also, that word is hard to type.',
      scalene: 'This triangle is scalene and mathematically boring.',
    }
    output[@type]
  end

  def recite_facts
    puts which_triangle
    angles = calculate_angles(side1, side2, side3)
    puts 'The angles of this triangle are ' + angles.join(',')
    puts 'This triangle is also a right triangle!' if angles.include? 90
    puts ''
  end

  def calculate_angles(a, b, c)
    [pythagoras(a, b, c),
     pythagoras(b, c, a),
     pythagoras(c, a, b),
    ]
  end

  def pythagoras(a, b, c)
    num = (b**2 + c**2 - a**2)
    den = (2.0 * b * c)
    radians_to_degrees(Math.acos(num / den))
  end

  def radians_to_degrees(rads)
    (rads * 180 / Math::PI).round
  end
end

triangles = [
  [5, 5, 5],
  [5, 12, 13],
]
triangles.each do |sides|
  tri = Triangle.new(*sides)
  tri.recite_facts
end
