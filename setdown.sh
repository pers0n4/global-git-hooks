#!/usr/bin/env bash
if [[ -d "~/.gittemplates" ]]; then
  rm -rf ~/.gittemplates
  git config --global --unset init.templatedir
  echo -e "\033[0;36m[INFO]\033[0m Custom git templates are removed"
fi
