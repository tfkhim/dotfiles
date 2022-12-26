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
if [[ -r "/usr/share/zsh-theme-powerlevel10k/config/p10k-rainbow.zsh" ]]; then
  source "/usr/share/zsh-theme-powerlevel10k/config/p10k-rainbow.zsh"
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
  # status element
  # --------------
  #
  # The status element is the first element on the
  # left side of the prompt. Therefore its visual
  # appearance should be similar to the dir element.
  # In case of an error there is already a red
  # background color set. This case therefore looks
  # already similar to the dir element. But the
  # default foreground color doesn't provide a high
  # contrast. Therefore we change it to white.
  #
  # Furthermore the success case is only a green
  # checkmark by default. The settings below change
  # this case to a white checkmark on a green
  # background.

  typeset -g POWERLEVEL9K_STATUS_ERROR_FOREGROUND=7
  typeset -g POWERLEVEL9K_STATUS_ERROR_SIGNAL_FOREGROUND=7
  typeset -g POWERLEVEL9K_STATUS_ERROR_PIPE_FOREGROUND=7

  typeset -g POWERLEVEL9K_STATUS_OK_FOREGROUND=7
  typeset -g POWERLEVEL9K_STATUS_OK_BACKGROUND=2

  typeset -g POWERLEVEL9K_STATUS_OK_PIPE_FOREGROUND=7
  typeset -g POWERLEVEL9K_STATUS_OK_PIPE_BACKGROUND=2

  #
  # execution time element
  # ----------------------
  #
  # The desired visual is black text on a yellow background.
  # But depending on the console emulator color scheme the
  # background might be orange.

  typeset -g POWERLEVEL9K_COMMAND_EXECUTION_TIME_FOREGROUND=0
  typeset -g POWERLEVEL9K_COMMAND_EXECUTION_TIME_BACKGROUND=226

  #
  # dir element
  # -----------
  #
  # Depending on the color scheme of the console
  # emulator the directory background is a very light
  # blue. In conjunction with a white foreground the
  # contrast is very low. Therefore a darker blue is
  # used for the background color.

  typeset -g POWERLEVEL9K_DIR_BACKGROUND=20
}
