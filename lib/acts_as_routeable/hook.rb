module ActsAsRouteable::Hook
  def acts_as_routeable(*args)
    options = args.extract_options!

    # controller code goes here
    
    include ActsAsRouteable::InstanceMethods
  end
end
