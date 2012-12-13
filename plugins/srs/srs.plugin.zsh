# -*-sh-*-

(( ${+ES_SRS_ROOT} )) || export ES_SRS_ROOT=$HOME/sp

function srspath {
    source $ES_SRS_ROOT/$1/activate.sh
    export CPPFLAGS="-I$ES_SRS_ROOT/$1/QuantLib -I$ES_SRS_ROOT/$1/QuantKit -I$ES_SRS_ROOT/$1/Shaft"
    export LDFLAGS="-L$ES_SRS_ROOT/$1/splibs/current/lib64"
    export PATH="$ES_SRS_ROOT/$1/splibs/current/bin:$PATH"
    if [ ! -z "$PS1" ] ; then
        pushd $ES_SRS_ROOT/$1 2>&1 >/dev/null
        br=$(hg branch)
        [ -f ".issue" ] && echo "default issue" `cat .issue`
        [ -f ".code-review" ] && echo "default code review" `cat .code-review`
        [ $br != $1 ] && echo "hmmm directory name ($1) /= branch name ($br)"
        popd 2>&1 >/dev/null
    fi
}

function show_branches {
    hg log -r "parents(::(children('$1')::'$2') and not(::'$1') and merge()) and not branch(default)" | grep -r "branch:\s*RISKDEV-" | sort | uniq
    # | cut -d":" -f2
}
