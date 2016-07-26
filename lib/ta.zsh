#!/bin/zsh
ta() {
    sessions=$(tmux list-sessions 2>/dev/null)
    if [ "$sessions" = "" ]
    then
        echo "Creating first session, name: "
        read sessionName
		if [ "$sessionName" = "" ]
		then
			sessionName="Main"
		fi
        tmux new -s "$sessionName"
    else
        numberOfSessions=$(echo "$sessions"| wc -l)
        if [ "$numberOfSessions" -gt 1 ]
        then
            isModern
            if [ $? -eq 1 ]
            then
                echo "Yay Modern"
                tmux attach \; choose-tree
            else
                echo "Nope Retro"
                echo "$sessions"
                read -p "Choose session: " selectedSession
                tmux a -t $selectedSession
            fi
        else
            tmux a
        fi
    fi
}

isModern() {
    v=$(tmux -V | cut -d" " -f2)
    mainVersion=$(echo "$v"| cut -d"." -f1)
    subVersion=$(echo "$v"| cut -d"." -f2)
    # echo "main $mainVersion \n sub $subVersion"
    if [ "$mainVersion" -gt 1 ]
    then
        return 1
    else
        if [ "$subVersion" -ge 8 ]
        then
            return 1
        else
            return 0
        fi
    fi
}

ta
