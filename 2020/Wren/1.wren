import "io" for File

var load_data = Fn.new {|path|
    return File.read(path).split("\n").map{|n| Num.fromString(n)}.toList
}

var Find_summing_digits = Fn.new{|data, digits, target|
    if (digits == 1) return data.contains(target) ? [target] : null
    for (n in data) {
        var others = Find_summing_digits.call(data, digits - 1, target - n)
        if (others) return [n] + others
    }
}

var data = load_data.call("../Data/1")
System.print(Find_summing_digits.call(data, 2, 2020).reduce{|n, m| n * m})
System.print(Find_summing_digits.call(data, 3, 2020).reduce{|n, m| n * m})
