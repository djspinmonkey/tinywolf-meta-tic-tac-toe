def context(name, &block)
  describe(name, &block)
end

class Object
  def falsey?; !self; end
  def truthy?; self; end
end


