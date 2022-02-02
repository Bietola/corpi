{
    ###############################
    # Scraped things from the net #
    ###############################
    # NB. Also a duplicated version with interpolated vim commands

    VIM_RECS='12 16 17 19 21 22 23 24 25 26 27'
    SCRAPES="$(
        # TODO: Bring back scraping and change to AOC
        # printf >&2 'Scraping python files from github\n'
        # ./0.scrape-from-gh https://github.com/nayuki/Project-Euler-solutions \
        #     e4ea051b715390924114aa35936f21a2ac585144 \
        #     -C \
        #     | grep .dyalog$ | /sul/largs cat
        # printf >&2 'Done scraping\n'

        # TODO: Convert this to some local python files when using them
        # Arrows were used extensively in ghci non-vim mode in this age... which should not be the case,
        # hence the perl sub
        # ./recs -n $VIM_RECS |\
        #     perl -pe 's/(<lft>|<rgt>|<up>|<dwn>)//g' |\
        #     ./1.proc-rec

        # Local bash history
        cat ../scrape/bash/history1 | ./1.proc-bash-history
    )"

    printf >&2 'Interpolating vim\n'
    ./3.intersperse-vim \
        -v <({
                printf >&2 'Extracting vim\n'
                ./recs -n $VIM_RECS |\
                    ./1.proc-rec |\
                    ./2.extract-vim
                printf >&2 'Done w extracting\n'
        }) \
        -c <({
            echo "$SCRAPES"
        } | tr -d '\n')
    printf >&2 'Interpolation over\n'

    echo "$SCRAPES"

    ##########################################
    # Extra things with no vim interpolation #
    ##########################################

    # Get relevant dasher history pieces
    ## Le past (no idea what I was doing)
    ./0.get-sk-history 24 26
    ./0.get-sk-history 30 37
    ## Euler
    ./0.get-sk-history 44 47 # Euler 11
    ./0.get-sk-history 49 55 # Shell

    # Add top 1000 stack overflow python answers for easy searching
    cat ../scrape/stack-exchange-queries/top1000-python-answers.csv

} | tr -d '\n'
