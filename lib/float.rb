class Float
  def rounding(x)
    # ( self * 20.0).round / 20.0
    (self * 10**x).round.to_f / 10**x
  end
end