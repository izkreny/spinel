# A program that gives Hash its own merge! or update keeps it for a Hash
# literal receiver too, however it binds the name: a module prepended, an
# alias, or define_method in a reopened Hash.
module Loud
  def merge!(o) = (puts "prepended merge!"; self)
end
Hash.prepend(Loud)

class Hash
  def quiet_update(o) = (puts "aliased update"; self)
  alias update quiet_update
end

p({}.merge!({ a: 1 }))
p({ "q" => 1 }.update({ "a" => 2 }))
