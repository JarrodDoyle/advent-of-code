import "io" for File

var to_dec = Fn.new{|arr|
    return (0...arr.count).map{|i| arr[i] * 2.pow(arr.count - 1 - i)}.reduce{|n, m| n + m}
}

var part_one = Fn.new{|data|
    var sums = (0...data[0].count).map{|i| data.reduce(0){|n,m| n + Num.fromString(m[i])}}.toList
    var gamma = to_dec.call(sums.map{|n| n >= data.count / 2 ? 1 : 0}.toList)
    var epsilon = to_dec.call(sums.map{|n| n <= data.count / 2 ? 1 : 0}.toList)
    return gamma * epsilon
}

var data = File.read("../Data/3").split("\n")
System.print(part_one.call(data))