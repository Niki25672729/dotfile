#!/usr/bin/env python
# -*- coding: utf-8 -*-

import sys

arg = sys.argv[1:]
while "(attached)" in arg:
    arg.remove("(attached)")
print(file=sys.stderr)
if "no" in arg[0]:
    print("Start a new sesstion", file=sys.stderr)
    print("Session name: ", end='', file=sys.stderr)
    name = input()
    print(name)
else:
    s = list([arg[i] for i in range(0, len(arg), 10)]) 
    s = list(map(lambda x: x[:-1], s))

    print("Available sesstion", file=sys.stderr)
    print("------------------", file=sys.stderr)
    for index in range(len(s)):
        print("[{}] {}".format(index, s[index]), file=sys.stderr)
    print("[n] New Session", file=sys.stderr)
    print(file=sys.stderr)

    print("Choose session: ", end='', file=sys.stderr)
    choice = input()
    if choice == 'n':
        print("Start a new sesstion", file=sys.stderr)
        print("Session name: ", end='', file=sys.stderr)
        name = input()
        print(name)
    else:
        choice = int(choice)
        print(s[choice])
print(file=sys.stderr)
