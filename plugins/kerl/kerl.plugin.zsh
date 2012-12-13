# -*-sh-*-

[[ ${+ES_ERL_ROOT} -eq 1 ]] || export ES_ERL_ROOT=$HOME/erlang

function acterl {
    source $ES_ERL_ROOT/$1/activate
}
