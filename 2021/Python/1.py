def load_data(fp):
    with open(fp) as f:
        data = [int(line) for line in f if line != ""]
    return data

def depth_increases(d, s):
    return sum(d[i] < d[i + s] for i in range(len(d) - s))

if __name__ == "__main__":
    data = load_data("../Data/1")
    print(depth_increases(data, 1))
    print(depth_increases(data, 3))