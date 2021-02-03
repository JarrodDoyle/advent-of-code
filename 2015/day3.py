with open("./day3input.txt") as f:
    path = f.read()

directions = {"^": (0, -1), "v": (0, 1), "<": (-1, 0), ">": (1, 0)}
pos = [(0, 0), (0, 0)]
visited_coordinates = {pos[0]}
for i in range(len(path)):
    pos[i % 2] = tuple(map(sum, zip(pos[i % 2], directions[path[i]])))
    visited_coordinates.add(pos[i % 2])
print(len(visited_coordinates))
