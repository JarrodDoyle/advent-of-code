with open("./day2input.txt") as f:
    lines = f.readlines()

required_paper = 0
required_ribbon = 0
for line in lines:
    l, w, h = [int(dimension) for dimension in line.split("x")]
    required_paper += 2 * (l * w + w * h + h * l) + (l * w * h) / max((l, w, h))
    required_ribbon += 2 * ((l + w + h) - max((l, w, h))) + l * w * h
print(required_paper)
print(required_ribbon)
