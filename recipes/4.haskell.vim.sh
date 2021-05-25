./3.intersperse-vim \
    -v <(./recs -n 12 16 17 19 21 22 23 24 25 26 27 | ./1.proc-rec | ./2.extract-vim) \
    -c <(./0.scrape-haskell-from-gh -nd 'https://github.com/glguy/advent2017' | ./1.proc-src)
