# -*-sh-*-

function tdev {
    tmux has-session -t $1 &>/dev/null
    if [ $? != 0 ] ; then
        tmux new-session -s $1 -n editor -d
        tmux send-keys -t $1 "cd $2" C-m
        tmux send-keys -t $1 "emacs -nw $2" C-m
        p=$(tmux new-window -n console -P -t $1)
        tmux split-window -h -t $p
        tmux select-layout -t $p main-vertical
        tmux send-keys -t$p.left "cd $2" C-m
        tmux send-keys -t$p.right "cd $2" C-m
        tmux select-window -p
    fi
    tmux attach -t $1
}
