thislist = ['apple', "banana", "cherry", "kiwi", "mango"]

newlist = [x for x  in thislist if "a" in x]
newlist = [x for x in range(10) if x < 5]
newlist = ['hello' for x in thislist]

print(newlist)
