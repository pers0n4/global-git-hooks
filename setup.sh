#!/usr/bin/env bash
TEMPLATE_DIR=~/.gittemplates

if [ -d "${TEMPLATE_DIR}" ]; then
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

cp -a ${GIT_CORE}/templates ${TEMPLATE_DIR}
curl -fsSL https://raw.githubusercontent.com/pers0n4/global-git-hooks/main/hooks/pre-commit -o "${TEMPLATE_DIR}/hooks/pre-commit"
chmod +x ${TEMPLATE_DIR}/hooks/pre-commit

git config --global init.templatedir "${TEMPLATE_DIR}"

echo -e "\033[0;36m[INFO]\033[0m Custom git templates are installed"
