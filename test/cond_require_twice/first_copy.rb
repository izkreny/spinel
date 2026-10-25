# A file whose first copy is inlined under a condition the compiler folds
# keeps its definitions unconditional: an alias_method chain still works.
require "crt/r"
p RGreeter.new.hi
