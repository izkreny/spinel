# A library required first in a branch a `defined?` guard leaves dead, then
# for real, keeps every file it requires under a condition of its own.
# The dead copy hoisted the second and later of them within itself, which
# marked them as loaded, so the live require skipped them and their
# constants were defined nowhere (motion-markdown-it's entry file and its
# runtime gems wrap their requires in `if defined?(Motion::Project::Config)`).
if defined?(DbrNope)
  require "dbr"
end
require "dbr"
p DBR_ONE
p DBR_TWO
p DBR_THREE
p require "dbr/two"

# a file required second under a live condition, and again after it,
# still loads once
unless defined?(DbrNope)
  require "dbrsib/a"
  require "dbrsib/b"
end
require "dbrsib/b"
