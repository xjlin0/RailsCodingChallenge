class Point
  attr_accessor :x, :y, :z

  def initialize(coordinates={})
    x = coordinates.fetch(:x) rescue raise("need x")
    y = coordinates.fetch(:y) rescue raise("need y")
    z = coordinates.fetch(:z) rescue raise("need z")
    @x = x.is_a?(Numeric) ? x : raise("not a number!")
    @y = y.is_a?(Numeric) ? y : raise("not a number!")
    @z = z.is_a?(Numeric) ? z : raise("not a number!")
  end

  def movex(x)
    shift = x.is_a?(Numeric) ? x : raise("not a number!")
    return Point.new(x: @x + shift, y: @y, z: @z)
  end

  def movey(y)
    shift = y.is_a?(Numeric) ? y : raise("not a number!")
    return Point.new(x: @x, y: @y + shift, z: @z)
  end

  def movez(z)
    shift = z.is_a?(Numeric) ? z : raise("not a number!")
    return Point.new(x: @x, y: @y, z: @z + shift)
  end

end


class Cuboid
  attr_accessor :origin, :length, :width, :height
  #BEGIN public methods that should be your starting point

    # length is on x axle, width is on y axle, height is on z axle
    def initialize(options={})
      origin = options.fetch(:origin) rescue raise("need a Point as the origin")
      length = options.fetch(:length) rescue raise("need length")
      width  = options.fetch(:width)  rescue raise("need width")
      height = options.fetch(:height) rescue raise("need height")
      @origin = origin.is_a?(Point) ? origin : raise("not a Point!")
      @length = options.fetch(:length).is_a?(Numeric) && length > 0 ? length : raise("need positive number!")
      @width  = options.fetch(:width).is_a?(Numeric)  && width  > 0 ? width  : raise("need positive number!")
      @height = options.fetch(:height).is_a?(Numeric) && height > 0 ? height : raise("need positive number!")
    end

  # Inputs of move_to! method is order-dependent, should be in the sequence of x , y , z.
  def move_to!(x, y, z)
    new_origin = Point.new(x: x, y: y, z: z)
    @origin = new_origin
  end

  # outout 8 points of a cuboid [length on x, width on y, height on z]
  def vertices
    o  = @origin
    ox = @origin.movex(@length)
    oy = @origin.movey(@width)
    oxy= ox.movey(@width)
    oz  = @origin.movez(@height)
    oxz = ox.movez(@height)
    oyz = oy.movez(@height)
    oxyz= oxz.movey(@width)
    return [ o, ox, oy, oxy, oz, oxz, oyz, oxyz ]
  end

  #Test if a point is excusively inside of a cuboid
  def contains?(point)
    p = point.is_a?(Point) ? point : raise("not a Point!")
    return false if p.x < @origin.x || p.x > @origin.movex(@length).x
    return false if p.y < @origin.y || p.y > @origin.movey(@width).y
    return false if p.z < @origin.z || p.z > @origin.movez(@height).z
    return true
  end

  #returns true if the two cuboids intersect each other.  False otherwise.
  def intersects?(other)
    other_cuboid = other.is_a?(Cuboid) ? other : raise("not a Cuboid!")
    other_cuboid.vertices.each do |vertice|
      return true if self.contains?(vertice)
    end
    return false
  end

  def rotate_at_x
    @height, @width = @width, @height
  end

  def rotate_at_y
    @height, @length = @length, @height
  end

  def rotate_at_z
    @length, @width = @width, @length
  end

  #END public methods that should be your starting point
end

