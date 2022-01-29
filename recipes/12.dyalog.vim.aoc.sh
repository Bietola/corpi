OLD_RECS='12 16 17 19 21 22 23 24 25 26 27'
NEW_RECS='30 31 32 33 34 35 36 37 44 45 46 47'
RECS="$OLD_RECS $NEW_RECS"

{

    printf >&2 'Interpolating vim\n'
    ./3.intersperse-vim \
        -v <({
                printf >&2 'Extracting vim\n'
                ./recs -n $RECS |\
                    ./1.proc-rec |\
                    ./2.extract-vim
                printf >&2 'Done w extracting\n'
        }) \
        -c <({
                echo ''
                
                # TODO: Try to fix scraping (doesn't work for now)
                # printf >&2 'Scraping aoc apl solutions from github\n'
                # ./0.scrape-from-gh https://github.com/jayfoad/aoc2020apl \
                #     881290e10697aa85be3f47a45efdb0b4b8d7ffd4 \
                #     -C \
                #     | grep .dyalog$ | /sul/largs cat
                # printf >&2 'Done scraping\n'

                # TODO: Convert this to some local python files when using them
                # Arrows were used extensively in ghci non-vim mode in this age... which should not be the case,
                # hence the perl sub
                # ./recs -n $RECS |\
                #     perl -pe 's/(<lft>|<rgt>|<up>|<dwn>)//g' |\
                #     ./1.proc-rec

                find ../scrape/apl/aoc2020apl/ -name *.dyalog | /sul/largs cat
        } | tr -d '\n')
    printf >&2 'Interpolation over\n'

    # This were all python things
    # # Get relevant dasher history pieces
    # ## Le past (no idea what I was doing)
    # ./0.get-sk-history 24 26
    # ./0.get-sk-history 30 37
    # ## Euler
    # ./0.get-sk-history 44 47 # Euler 11
    # Add top 1000 stack overflow python answers for easy searching
    # cat ../scrape/stack-exchange-queries/top1000-python-answers.csv

} | tr -d '\n'
