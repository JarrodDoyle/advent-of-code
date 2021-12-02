import "io" for File

var load_data = Fn.new {|path|
    return File.read(path).trim().split("\n").map{|n| Num.fromString(n)}.toList
}

var count_depth_increases = Fn.new {|d, s|
    return (s...d.count).where{|i| d[i-s] < d[i]}.count
}

var data = load_data.call("../Data/1")
System.print(count_depth_increases.call(data, 1))
System.print(count_depth_increases.call(data, 3))