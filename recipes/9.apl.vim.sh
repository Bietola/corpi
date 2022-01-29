RECS='12 16 17 19 21 22 23 24 25 26 27'

{

    ./3.intersperse-vim \
        -v <(./recs -n $RECS |\
                ./1.proc-rec |\
                ./2.extract-vim \ 
            ) \
        -c <({

                ./0.scrape-haskell-from-gh -C 'https://github.com/glguy/advent2017' \
                    fed4592b076d255297dbddf2a183c70d6d0acfa4 |\
                    ./1.proc-src

                ./0.scrape-haskell-from-gh -C 'https://github.com/Bietola/streamkey' \
                    492addee6725398797081ba8481454fa779dcf63 |\
                    ./1.proc-src

                # Arrows were used extensively in ghci non-vim mode in this age... which should not be the case,
                # hence the perl sub
                ./recs -n $RECS |\
                    perl -pe 's/(<lft>|<rgt>|<up>|<dwn>)//g' |\
                    ./1.proc-rec

            } | tr -d '\n')

    ./0.get-sk-history 1 14 | ./0.refine-sk-history-before-14

    ./0.get-sk-history 24 26
    ./0.get-sk-history 30 37

} | tr -d '\n'
