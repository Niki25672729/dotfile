#!/usr/bin/env python
# -*- coding: utf-8 -*-

import os, sys
from sys import stderr

arg = sys.argv[1:]
while "(attached)" in arg:
    arg.remove("(attached)")
print(file=stderr)
if "no" in arg[0]:
    print("Start a new sesstion", file=stderr)
    print("Session name: ", end='', file=stderr)
    name = input()
    print(name)
else:
    s = list([arg[i] for i in range(0, len(arg), 10)]) 
    s = list(map(lambda x: x[:-1], s))

    print("Available sesstion", file=stderr)
    print("------------------", file=stderr)
    for index in range(len(s)):
        print("[{}] {}".format(index, s[index]), file=stderr)
    print("[n] New Session", file=stderr)
    print(file=stderr)

    print("Choose session: ", end='', file=stderr)
    choice = input()
    if choice == 'n':
        print("Start a new sesstion", file=stderr)
        print("Session name: ", end='', file=stderr)
        name = input()
        print(name)
    else:
        choice = int(choice)
        print(s[choice])
print(file=stderr)
