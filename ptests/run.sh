# for every folder in the current directory

# if [${2} == "profile"]; then

    # for dir in $(ls -d */); do
    #     dir=${dir%?}
    #     echo "$dir"
    #     cd $dir
    #     sh ../generateprofile.sh $dir
    #     cd ..
    # done

# fi
# else if [${2} == "pass"]; then

    for dir in $(ls -d */); do
        dir=${dir%?}
        echo "$dir"
        cd $dir
        sh ../runpasses.sh $dir
        cd ..
    done

# fi
# fi

/bin/python3 /n/eecs583b/home/jsymonds/W24_EECS583_HW2/ptests/plotData.py