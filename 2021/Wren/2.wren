import "io" for File

var load_data = Fn.new{|path|
    return File.read(path).split("\n").map{|l|
        var instruction = l.split(" ")
        instruction[1] = Num.fromString(instruction[1])
        return instruction
    }.toList
}

var calculate_position = Fn.new{|data|
    var a = [0, 0, 0]
    for (i in data) {
        if (i[0] == "forward") {
            a[0] = a[0] + i[1]
            a[1] = a[1] + a[2] * i[1]
        } else {
            a[2] = a[2] + (i[0] == "up" ? -1 : 1) * i[1]
        }
    }
    return a
}

var data = load_data.call("../Data/2")
var answer = calculate_position.call(data)
System.print(answer[0] * answer[2])
System.print(answer[0] * answer[1])