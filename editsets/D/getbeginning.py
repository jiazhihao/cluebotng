import sys

splitpoint = int(sys.argv[1])

curedit = 0
f = open('trial.xml')
for x in f:
  if x.strip() == '<WPEdit>':
    curedit += 1
    if curedit == splitpoint:
      break
    print x,
  else:
    print x,
