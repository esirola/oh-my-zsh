# -*-sh-*-

# Mercurial
alias hgc='hg commit'
alias hgb='hg branch'
alias hgba='hg branches'
alias hgco='hg checkout'
alias hgd='hg diff'
alias hged='hg diffmerge'
# pull and update
alias hgl='hg pull -u'
alias hgp='hg push'
alias hgs='hg status'
# this is the 'git commit --amend' equivalent
alias hgca='hg qimport -r tip ; hg qrefresh -e ; hg qfinish tip'


function parse_hg_dirty() {
    if [[ -n $(hg status 2> /dev/null) ]]; then
        echo "$ZSH_THEME_HG_PROMPT_DIRTY"
    else
        echo "$ZSH_THEME_HG_PROMPT_CLEAN"
    fi
}

function hg_current_root() {
    typeset br=$(hg root 2> /dev/null) || return 1
    echo $br
}

function hg_current_branch() {
    typeset br=$(hg identify -b 2> /dev/null) || return 1
    echo $br
}

function hg_mq_applied() {
    typeset mqa=$(hg qapplied 2> /dev/null) || return 1
    echo $mqa
}

function hg_prompt_info() {
    branch=$(hg identify -btB 2> /dev/null) || return
    # full prompt can be slow on huge repos
    #echo "$ZSH_THEME_HG_PROMPT_PREFIX${branch}$(parse_hg_dirty)$ZSH_THEME_HG_PROMPT_SUFFIX"
    echo "$ZSH_THEME_HG_PROMPT_PREFIX${branch}$ZSH_THEME_HG_PROMPT_CLEAN$ZSH_THEME_HG_PROMPT_SUFFIX"
}
