class Point
  attr_accessor :x, :y, :z

  def initialize(coordinates={})
    x = coordinates.fetch(:x)
    y = coordinates.fetch(:y)
    z = coordinates.fetch(:z)
    self.x = x.is_a?(Numeric) ? x : raise("not a number!")
    self.y = y.is_a?(Numeric) ? y : raise("not a number!")
    self.z = z.is_a?(Numeric) ? z : raise("not a number!")
  end
end


class Cuboid
  attr_accessor :origin, :length, :width, :height
  #BEGIN public methods that should be your starting point
    def initialize(options={})
      origin = options.fetch(:origin)
      length = options.fetch(:length)
      width  = options.fetch(:width)
      height = options.fetch(:height)
      self.origin = origin.is_a?(Point)   ? origin : raise("not a Point!")
      self.length = length.is_a?(Numeric) ? length : raise("not a number!")
      self.width  = width.is_a?(Numeric)  ? width  : raise("not a number!")
      self.height = height.is_a?(Numeric) ? height : raise("not a number!")
    end

  def move_to!(x, y, z)
  end

  def vertices
  end

  #returns true if the two cuboids intersect each other.  False otherwise.
  def intersects?(other)
  end

  #END public methods that should be your starting point
end


p origin1 = Point.new(x: 1, y: 2, z:3)
p cuboid1 = Cuboid.new(origin: origin1, length: 3, width: 5, height: 7)

