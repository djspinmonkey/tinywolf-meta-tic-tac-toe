class Bacon::Context
  def context(name, &block)
    describe(name, &block)
  end
end

class Object
  def falsey?; !self; end
  def truthy?; self; end
end


