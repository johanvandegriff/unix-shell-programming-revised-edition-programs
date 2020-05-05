#!/bin/bash
echo '
find . | while read line
do
  if [[ -f "$line" ]]
  then
    du -s "$line" | cut -f1 -d'	'
  fi
done > sizes.txt
'

cat sizes.txt | gawk '


# Bin data for a histogram
# Modifying Tara Murphys code
# usage: for data values between 0 and 10, with 5 bins
# gawk -f histbin.awk 0 10 5 data.out data.in

BEGIN { 
  m = ARGV[1]      # minimum value of x axis
  ARGV[1] = ""
  M = ARGV[2]      # maximum value of x axis
  ARGV[2] = ""
  b = ARGV[3]      # number of bins
  ARGV[3] = ""
  file = ARGV[4]   # output file for plotting
  ARGV[4] = ""
  
  m=0
  M=7
  b=50
  file="sizes_hist.txt"

  w = (M-m)/b      # width of each bin
  
  print "number of bins = "b
  print "width of bins  = "w 
  print

  # set up arrays
  for (i = 1 ; i <= b; ++i) {
    n[i] = m+(i*w)        # upper bound of bin
    c[i] = n[i] - (w/2)   # centre of bin
    f[i] = 0              # frequency count
  }
}

{ 
  # bins the data
  for (i = 1; i <= b; ++i)
    if (log($1)/log(10) <= n[i]) {
         ++f[i]
         break
    } 
}

END {
  # print results to screen
  # and to a file for plotting
  print "bin(centre) = freq"

  for (i = 1; i <= b; ++i) {
    if (f[i] > 0) {
      print "bin("c[i]")", "=", f[i]
      print c[i], f[i] > file
    }
    else {
      print "bin("c[i]")", "=", 0
      print c[i], 0 > file
    }
  }
}



'
