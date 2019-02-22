#!/usr/bin/python
import sys

def mapper():

	top = []
	start = int(sys.argv[1])
	end = int(sys.argv[2])

	for line in sys.stdin:
		line = line.strip().split('\t')
		hr_ip, count = line
		hr, ip = hr_ip.split(' ')

		try:
			hr = int(hr)
		    count = int(count)    
		    top.append([hr, ip, count])

		except ValueError:
			pass 

	subtop = [i for i in top if (i[0] > start) & (i[0] < end]
	top_n = sorted(subtop, key=lambda v:v[2], reverse=True)[0:3]
	
	for i in top_n:
		print '%s' % (i)

if __name__ == "__main__":
	mapper()