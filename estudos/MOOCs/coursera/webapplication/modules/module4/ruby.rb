class MyClass
  def boo #getter
    return @boo
  end
  def boo=(val) #setter
    @boo = val
  end
end

mc = MyClass.new
boo = 1
boo
