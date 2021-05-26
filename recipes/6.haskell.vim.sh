RECS='12 16 17 19 21 22 23 24 25 26 27'

{

    ./3.intersperse-vim \
        -v <(./recs -n $RECS |\
                ./1.proc-rec |\
                ./2.extract-vim \ 
            ) \
        -c <({

                ./0.scrape-haskell-from-gh -nd 'https://github.com/glguy/advent2017' |\
                    ./1.proc-src

                # Arrows where used extensively in ghci non-vim mode in this age... which should not be the case,
                # hence the perl sub
                ./recs -n $RECS |\
                    perl -pe 's/(<lft>|<rgt>|<up>|<dwn>)//g' |\
                    ./1.proc-rec

            } | tr -d '\n')

    ./0.refine-sk-history-before-37

} | tr -d '\n'
