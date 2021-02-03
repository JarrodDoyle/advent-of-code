with open("./day1input.txt") as f:
    data = f.read()

values = {"(": 1, ")": -1}
floor = 0
basement_visited = False
for i in range(len(data)):
    floor += values[data[i]]
    if floor == -1 and not basement_visited:
        print(i + 1)
        basement_visited = True
print(floor)
