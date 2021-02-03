import hashlib

with open("./day4input.txt") as f:
    key = f.read()

key_suffix = 1
five_found = False
while True:
    result = hashlib.md5((key + str(key_suffix)).encode()).hexdigest()
    if result[:5] == "00000" and not five_found:
        print(key_suffix)
        five_found = True
    if result[:6] == "000000":
        print(key_suffix)
        break
    key_suffix += 1
