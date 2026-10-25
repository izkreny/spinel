class RGreeter
  def hi = "hi"
end
class RGreeter
  alias_method :old_hi, :hi
  def hi = old_hi + "!"
end
