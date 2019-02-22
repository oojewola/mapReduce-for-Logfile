#!usr/bin/python 

from operator import itemgetter
from collections import defaultdict
import sys

top = defaultdict(list)

for line in sys.stdin:
	line = line.strip().split('\t')
	hr_ip, count = line
	hr, ip = hr_ip.split(' ')

	try:
		hr = int(hr)
	    count = int(count)    
	    top[hr].append([ip, count])

	except ValueError:
		pass 

for i in range(24):
    top_n = sorted(top[i], key=lambda v:v[1], reverse=True)[0:3]
    print '%s\t%s' % (i, top_n)
