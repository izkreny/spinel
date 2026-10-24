# A library required first in a branch a `defined?` guard leaves dead, then
# for real, keeps every file it requires under a condition of its own.
# The dead copy hoisted the second and later of them out of the condition,
# which marked them as loaded, so the live require skipped them and their
# constants were defined nowhere (motion-markdown-it's entry file and its
# runtime gems wrap their requires in `if defined?(Motion::Project::Config)`).
if defined?(DbrNope)
  require "dbr"
end
require "dbr"
p DBR_ONE
p DBR_TWO
p DBR_THREE

# two requires in a loop body still load their files once
require "dbrloop"
p dbr_loop_one
