module ActsAsRouteable::InstanceMethods
  # has_many routes or has_one route? hmmm
  # instance methods go here!

  # TODO return constructed directions_json
  def directions
  end

  # TODO Return constrcuted polyline_json
  def path
  end

  # TODO Return whether or not the point
  # is contained within a certain amount of polyline_json
  def contains?(point, within = .25)
  end
end
