./recs \
    -n 12 -n 16 -n 17 \
    -n 19 -n 21 -n 22 \
    -n 23 -n 24 -n 25 \
    -n 26 -n 27 |\
    ./1.proc-rec |\
    # Correction until vim mode works in ghci 
    perl -pe 's/(<lft>|<rgt>|<up>|<dwn>)//g'
