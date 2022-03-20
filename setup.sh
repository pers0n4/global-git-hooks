#!/usr/bin/env bash
if [ -d ~/.gittemplates ]; then
  echo -e "\033[0;31m[ERROR]\033[0m Custom git templates are already exist"
  exit 1
fi

case "${OSTYPE}" in
linux-gnu)
  GIT_CORE="/usr/share/git-core"
  ;;
darwin*)
  GIT_CORE="/Library/Developer/CommandLineTools/usr/share/git-core"
  ;;
cygwin | msys)
  GIT_CORE="/mingw64/share/git-core"
  ;;
*)
  echo "Unsupported OS"
  exit 1
  ;;
esac

cp -a ${GIT_CORE}/templates ~/.gittemplates
cp -a ~/.gittemplates/hooks/pre-commit.sample ~/.gittemplates/hooks/pre-commit

git config --global init.templatedir ~/.gittemplates

echo -e "\033[0;36m[INFO]\033[0m Custom git templates are installed"
