class Point
  attr_accessor :x, :y, :z

  def initialize(coordinates={})
    x = coordinates.fetch(:x)
    y = coordinates.fetch(:y)
    z = coordinates.fetch(:z)
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
    def initialize(options={})
      # length is on x axle, width is on y axle, height is on z axle
      origin = options.fetch(:origin)
      length = options.fetch(:length)
      width  = options.fetch(:width)
      height = options.fetch(:height)
      @origin = origin.is_a?(Point)   ? origin : raise("not a Point!")
      @length = length > 0 ? length : raise("need positive number!")
      @width  = width  > 0 ? width  : raise("need positive number!")
      @height = height > 0 ? height : raise("need positive number!")
    end

  def move_to!(x, y, z)
    # Inputs of move_to! method is order-depedent, should be x , y , z.
    new_origin = Point.new(x: x, y: y, z: z)
    @origin = new_origin
  end

  def vertices # length is on x axle, width is on y axle, height is on z axle
    # outout 8 points of a cuboid
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

  #returns true if the two cuboids intersect each other.  False otherwise.
  def intersects?(other)
  end

  #END public methods that should be your starting point
end


