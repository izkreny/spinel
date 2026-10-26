# A file required under a live condition, then again, loads once.
# Run with -I test/cond_require_twice (cli-opts-test).
unless defined?(Nope)
  require "crt/b"
end
require "crt/b"
p require "crt/b"

require "crt/c" unless defined?(Nope)
p require "crt/c"

if defined?(Nope)
  require "crt/d"
end
p require "crt/d"
p require "crt/d"

if ENV["SPINEL_CRT_NOPE"]
  require "crt/e"
end
require "crt/e"
e_hello

unless defined?(Nope)
  require_relative "crt/f"
end
p require_relative "crt/f"

if ENV["SPINEL_CRT_NOPE"]
  require "crt/h"
end
p require "crt/h"
p __LINE__

if ENV["SPINEL_CRT_NOPE"]
  require "crt/i"
end
require "crt/i"
puts "after i"
p __LINE__

if ENV["SPINEL_CRT_NOPE"]
  require "crt/k"
end
def load_k
  require "crt/k"
end
puts "before k"
p load_k
p load_k

if ENV["SPINEL_CRT_NOPE"]
  require_relative "crt/m"
end
2.times { p require_relative "crt/m" }

unless defined?(Nope)
  require "crt/n2"
end
p require "crt/n"

unless defined?(Nope)
  require_relative "crt/o2"
end
p require_relative "crt/o"

if ENV["SPINEL_CRT_NOPE"]
  require "crt/p"
end
unless defined?(Nope)
  require "crt/p2"
end
p p_name

if ENV["SPINEL_CRT_NOPE"]
  require_relative "crt/q"
end
unless defined?(Nope)
  require_relative "crt/q2"
end
p q_name

unless defined?(Nope)
  require "crt/s"
end
unless defined?(Nope)
  require_relative "crt/s"
end
puts "after s"

# a file the guarded copy requires lazily, inside a method, has not run
unless defined?(Nope)
  require_relative "crt/t"
end
p require_relative "crt/t2"

# a load that raised leaves its file unloaded
begin
  require "crt/u"
rescue => e
  puts "rescued #{e.message}"
end
p require "crt/u"

# a value-live require in a guarded copy loads its file there
unless defined?(Nope)
  require_relative "crt/v"
end
p require_relative "crt/v2"

# a lazy require in a dead branch leaves the file to a later copy
if defined?(Nope)
  require_relative "crt/w"
end
unless defined?(Nope)
  require_relative "crt/w2"
end
p require_relative "crt/w3"
