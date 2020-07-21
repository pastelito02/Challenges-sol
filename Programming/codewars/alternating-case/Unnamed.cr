#Unnamed
class String
  private UPPER = ('A'..'Z').join
  private LOWER = ('a'..'z').join
  def to_alternating_case
    self.tr(UPPER + LOWER, LOWER + UPPER)
  end
end
