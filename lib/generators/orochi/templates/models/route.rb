class Route < ActiveRecord::Base
  has_many :legs

  def each_step(&block)
    self.legs.each do |leg|
      leg.each do |step|
        yield step
      end
    end
  end
end
