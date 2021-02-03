with open("./day5input.txt") as f:
    strings = f.readlines()

bad_pairs = ["ab", "cd", "pq", "xy"]
vowels = ["a", "e", "i", "o", "u"]
nice_strings = 0
for s in strings:
    if len(s) < 3:
        continue

    num_vowels = 1 if s[0] in vowels else 0
    double_letter = False
    for i in range(1, len(s)):
        if s[i - 1] + s[i] in bad_pairs:
            break
        double_letter = True if double_letter or s[i - 1] == s[i] else False
        num_vowels += 1 if s[i] in vowels else 0
    else:
        if (num_vowels >= 3) and double_letter:
            nice_strings += 1
print(nice_strings)
