# merge!, update and replace into a hash parameter of a Hash subclass instance
# that is itself a boxed parameter, its callers passing hashes of different
# kinds: the instance holds its class's Hash, and that is what each call checks
# against the receiver. A receiver that cannot hold its keys or values widens.
class Counts < Hash; end
counts = Counts.new
counts["d"] = 5
def merged(obj, source) = (obj.merge!(source); obj)
p merged({ "c" => "x" }, counts)
p merged({ "a" => 1 }, { "b" => 2 })

class Tally < Hash; end
tally = Tally.new
tally["d"] = 6
def updated(obj, source) = (obj.update(source); obj)
p updated({ "c" => "x" }, tally)
p updated({ "a" => 1 }, { "b" => 2 })

# replace takes the instance's entries in place of the old ones
class Fresh < Hash; end
fresh = Fresh.new
fresh["d"] = 7
def replaced(obj, source) = (obj.replace(source); obj)
p replaced({ "c" => "x" }, fresh)
p replaced({ "a" => 1 }, { "b" => 2 })

# a subclass's subclass holds the Hash its root class does
class Base < Hash; end
class Derived < Base; end
derived = Derived.new
derived["d"] = 8
def inherited(obj, source) = (obj.merge!(source); obj)
p inherited({ "c" => "x" }, derived)
p inherited({ "a" => 1 }, { "b" => 2 })

# a key of another kind
class Tags < Hash; end
tags = Tags.new
tags[:sym] = "v"
def keyed(obj, source) = (obj.merge!(source); obj)
p keyed({ "c" => "x" }, tags)
p keyed({ "a" => 1 }, { "b" => 2 })

# entries that fit merge too
class Names < Hash; end
names = Names.new
names["d"] = "fits"
def fitting(obj, source) = (obj.merge!(source); obj)
p fitting({ "c" => "x" }, names)
p fitting({ "e" => "y" }, { "b" => "z" })

# by keyword
class Opts < Hash; end
opts = Opts.new
opts["d"] = 9
def by_name(obj, source:) = (obj.merge!(source); obj)
p by_name({ "c" => "x" }, source: opts)
p by_name({ "a" => 1 }, source: { "b" => 2 })

# a caller handing its own parameters on stores them the same way
class Passed < Hash; end
passed = Passed.new
passed["d"] = 10
def inner(obj, source) = (obj.merge!(source); obj)
def outer(obj, source) = inner(obj, source)
p outer({ "c" => "x" }, passed)
p outer({ "a" => 1 }, { "b" => 2 })

# the caller sees the store, and the source is left as it was
held = { "c" => "x" }
merged(held, counts)
p held
p counts, counts.class
