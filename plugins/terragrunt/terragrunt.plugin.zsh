function tg_prompt_info() {
  # dont show 'default' workspace in home dir
  [[ "$PWD" != ~ ]] || return
  # check if in terragrunt dir and file exists
  [[ -d .terragrunt-cache && -r .terragrunt-cache/environment ]] || return

  local workspace="$(< .terragrunt-cache/environment)"
  echo "${ZSH_THEME_TG_PROMPT_PREFIX-[}${workspace:gs/%/%%}${ZSH_THEME_TG_PROMPT_SUFFIX-]}"
}

function tg_version_prompt_info() {
    local terragrunt_version
    terragrunt_version=$(terragrunt --version | head -n 1 | cut -d ' ' -f 2)
    echo "${ZSH_THEME_TG_VERSION_PROMPT_PREFIX-[}${terragrunt_version:gs/%/%%}${ZSH_THEME_TG_VERSION_PROMPT_SUFFIX-]}"
}

alias tg='terragrunt'
alias tga='terragrunt apply'
alias tgc='terragrunt console'
alias tgd='terragrunt destroy'
alias tgf='terragrunt fmt'
alias tgi='terragrunt init'
alias tgo='terragrunt output'
alias tgp='terragrunt plan'
alias tgv='terragrunt validate'
alias tgs='terragrunt state'
alias tgsh='terragrunt show'