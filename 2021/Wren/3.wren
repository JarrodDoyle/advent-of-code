import "io" for File

var to_dec = Fn.new{|arr|
    return (0...arr.count).map{|i| arr[i] * 2.pow(arr.count - 1 - i)}.reduce{|n, m| n + m}
}

var calc_gamma_epsilon = Fn.new{|data|
    var sums = (0...data[0].count).map{|i| data.reduce(0){|n,m| n + Num.fromString(m[i])}}.toList
    var gam = sums.map{|n| n >= data.count / 2 ? 1 : 0}.toList
    return to_dec.call(gam) * to_dec.call(gam.map{|n| (n - 1).abs}.toList)
}

var ogr_csr = Fn.new{|data, s, t, f|
    for (i in 0...data[0].count) {
        var r = data.where{|l| l.startsWith(s.join())}.toList
        s.add(r.count == 1 ? Num.fromString(r[0][i]) : r.reduce(0){|n, m| n + Num.fromString(m[i])} >= r.count / 2 ? t : f)
    }
    return s
} 

var data = File.read("../Data/3").split("\n")
System.print(calc_gamma_epsilon.call(data))
System.print(to_dec.call(ogr_csr.call(data, [], 1, 0)) * to_dec.call(ogr_csr.call(data, [], 0, 1)))