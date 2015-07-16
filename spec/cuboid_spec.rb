require 'cuboid'

#This test is incomplete and, in fact, won't even run without errors.
#  Do whatever you need to do to make it work and please add your own test cases for as many
#  methods as you feel need coverage
describe Cuboid do
  point   = Point.new(x: 0, y: 0, z: 0)
  subject = Cuboid.new(origin: point, length: 10, width: 15, height: 20)
  describe '#move_to!' do
    it "changes the origin in the simple happy case" do
      expect(subject.move_to!(1,2,3).x).to eq(1)
      expect(subject.move_to!(1,2,3).y).to eq(2)
      expect(subject.move_to!(1,2,3).z).to eq(3)
    end
  end

  describe '#vertices' do
    it "return 8 points of the moved cuboid" do
      expect(subject.vertices.length).to eq(8)
      expect(subject.vertices.last).to be_a Point
      expect(subject.vertices.last.z).to eq(23)
    end
  end

  describe '#contains?' do
    inclusive_point = Point.new(x: 3, y: 3, z: 3)
    exclusive_point = Point.new(x: 300, y: 300, z: 300)

    it "should return true if the a given point is located within the cuboid" do
      expect(subject.contains?(inclusive_point)).to be true
    end

    it "should return false if the a given point is outside of the cuboid" do
      expect(subject.contains?(exclusive_point)).to be false
    end
  end

  describe '#intersects?' do
    point1   = Point.new(x: 0, y: 0, z: 0)
    subject1 = Cuboid.new(origin: point1, length: 10, width: 15, height: 20)
    point2   = Point.new(x: 100, y: 200, z: 300)
    subject2 = Cuboid.new(origin: point2, length: 8, width: 12, height: 30)

    it "return true if two cuboids overlap to each other" do
      expect(subject.intersects?(subject1)).to be true
    end

    it "return false if two cuboids don't overlap to each other" do
      expect(subject.intersects?(subject2)).to be false
    end
  end

  describe '#rotate_by_x!' do
    point3   = Point.new(x: 0, y: 0, z: 0)
    subject3 = Cuboid.new(origin: point3, length: 2, width: 1, height: 5)
    subject3.rotate_by_x!

    it "should rotate the cuboid by x axle" do
      expect(subject3.height).to eq(1)
    end
  end
end
