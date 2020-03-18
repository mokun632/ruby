
class Sa
  def yeller(s)
    a = s.map do |i|
      i.upcase
    end
    puts a.join
  end
end

a = Sa.new
a.yeller(['o','l','d'])
