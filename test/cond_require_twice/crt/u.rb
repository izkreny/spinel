puts "u loaded"
$u_n = ($u_n || 0) + 1
raise "boom" if $u_n == 1
