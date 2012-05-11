import sys

splitpoint = int(sys.argv[1])

curedit = 0
f = open('trial.xml')
printing = False
for x in f:
  if x.strip() == '<WPEdit>':
    curedit += 1
    if curedit == splitpoint:
      printing = True
    print x,
  elif printing:
    print x,
