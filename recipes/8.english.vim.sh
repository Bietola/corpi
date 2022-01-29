REP=/home/dincio/corpi
RECS='12 16 17 19 21 22 23 24 25 26 27'

{

    ./3.intersperse-vim \
        -v <(./recs -n $RECS |\
                ./1.proc-rec |\
                ./2.extract-vim \ 
            ) \
        -c <({

                cat "$REP/scrape/english/dasher-default-training-file.txt"

            } | tr -d '\n')

    # TODO: Left for future history additions
    # ./0.get-sk-history 30 37

} | tr -d '\n'
