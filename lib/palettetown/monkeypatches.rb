class Fixnum
  def percent
    return self / 100.0
  end
  def degrees
    return self * (Math::PI / 180.0)
  end
end
