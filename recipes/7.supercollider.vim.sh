VIM_RECS='12 16 17 19 21 22 23 24 25 26 27'
SC_RECS='NONEFORNOW'

{

    ./3.intersperse-vim \
        -v <(./recs -n $VIM_RECS |\
                ./1.proc-rec |\
                ./2.extract-vim \ 
            ) \
        -c <({

                ./sc/0.get-scraped | ./1.proc-src

                # Here will go supercollider recs when they're a thing
                # ./recs -n $RECS |\
                #     ./1.proc-rec

            } | tr -d '\n')

} | tr -d '\n'
