function virtualenv_prompt_info(){
  if [[ -n $VIRTUAL_ENV ]]; then
    printf "%s[%s] " "%{${fg[yellow]}%}" ${${VIRTUAL_ENV}:t}
  fi
}

# disables prompt mangling in virtual_env/bin/activate
export VIRTUAL_ENV_DISABLE_PROMPT=1

[[ ${+VE_ROOT} -eq 1 ]] || export VE_ROOT=$HOME/.virtualenv

function ve {
    source $VE_ROOT/$1/bin/activate
}
