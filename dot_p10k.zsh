# This file is part of https://github.com/tfkhim/dotfiles
#
# Copyright (c) 2022 Thomas Himmelstoss
#
# This software is subject to the MIT license. You should have
# received a copy of the license along with this program.

[[ $ZSH_VERSION == (5.<1->*|<6->.*) ]] || return

# Use the rainbow configuration as the baseline. Afterwards
# change only those settings which are necessary to achieve
# the desired appearance.
if [[ -r "/usr/share/zsh-theme-powerlevel10k/config/p10k-classic.zsh" ]]; then
  source "/usr/share/zsh-theme-powerlevel10k/config/p10k-classic.zsh"
fi

() {

  #
  # General setup
  # =============
  #

  # This setting is based on running the configuration
  # wizzard. Not all icons of the font seem to be mono
  # spaced. Installing a font with patched nerd font
  # and configuring this in the terminal emulator should
  # fix this issue.
  typeset -g POWERLEVEL9K_ICON_PADDING=moderate

  # Do not add an extra new line before the prompt. The
  # extra line might be confusing if one forgets where
  # it is comming from.
  typeset -g POWERLEVEL9K_PROMPT_ADD_NEWLINE=false

  #
  # Prompt element setup
  # ====================
  #

  # Some reasons for this setup:
  #
  # - Having the status and execution time of the last command
  #   as the first elements in the prompt feels more natural.
  #   You first read the information for the last call and then
  #   only context information for the next call comes afterwards.

  typeset -g POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(
    status
    command_execution_time
    dir
    vcs
  )

  typeset -g POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(
    background_jobs
    virtualenv
    pyenv
    nvm
    node_version
    rust_version
    java_version
    kubecontext
    terraform
    aws
    aws_eb_env
    ranger
    nnn
    xplr
    vim_shell
    midnight_commander
    vi_mode
  )

  #
  # general styling
  # ---------------
  #
  # This settings disable the powerline style and
  # replace it by a more lean styling. There is
  # now background color for the individual elements,
  # but  angle separators between them and at the
  # end of the left prompt and start of the right
  # prompt.

  typeset -g POWERLEVEL9K_BACKGROUND=
  typeset -g POWERLEVEL9K_FOREGROUND=7

  typeset -g POWERLEVEL9K_LEFT_SUBSEGMENT_SEPARATOR='%244F\uE0B1'
  typeset -g POWERLEVEL9K_RIGHT_SUBSEGMENT_SEPARATOR='%244F\uE0B3'
  typeset -g POWERLEVEL9K_LEFT_PROMPT_LAST_SEGMENT_END_SYMBOL='%244F\uE0B1'
  typeset -g POWERLEVEL9K_RIGHT_PROMPT_FIRST_SEGMENT_START_SYMBOL='%244F\uE0B3'

  #
  # vcs status
  # ----------
  #
  # Do not show the Git or GitHub icon at the start but
  # show the branch icon if currently on a branch.
  typeset -g POWERLEVEL9K_VCS_VISUAL_IDENTIFIER_EXPANSION=''
  typeset -g POWERLEVEL9K_VCS_BRANCH_ICON='\uF126 '

  #
  # rust_version
  # ------------
  #
  # Use a more "rusty" color instead of the default cyan.
  # The default icon is also very small. Using a string as
  # identifier is much more readable.

  typeset -g POWERLEVEL9K_RUST_VERSION_FOREGROUND=136
  typeset -g POWERLEVEL9K_RUST_VERSION_VISUAL_IDENTIFIER_EXPANSION='[rust]'

  #
  # node_version
  # ------------
  #
  # The default icon isn't related to Node.JS at all. Sadly
  # there is no Node.JS symbol that is big enough to recognize
  # it. Therefore a string identifier is used here, too.

  typeset -g POWERLEVEL9K_NODE_VERSION_VISUAL_IDENTIFIER_EXPANSION='[node]'
}
