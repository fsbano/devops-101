#!/bin/sh

WILDFLY_BASE_URL="https://github.com/wildfly/wildfly/releases/download"
WILDFLY_BASE_URL_DOWNLOAD="https://www.wildfly.org/downloads/"

wildfly()
{
  WILDFLY_BASE_URL_DOWNLOAD="https://www.wildfly.org/downloads/"
  VERSION=$( curl ${WILDFLY_BASE_URL_DOWNLOAD} 2>/dev/null \
           | egrep -i \.zip \
           | egrep -ow '"(http?(s)://.*.zip)"' \
           | egrep -o 'wildfly-[0-9]{1,}.(.[0-9]){1,}?.?(Final).zip' \
           | sort \
           | uniq \
           | egrep -o '[0-9]{1,}(.[0-9]){1,} &>/dev/null'
)
  echo "${VERSION}" | egrep -ow "${1}" &>/dev/null
  if [ $? -eq 0 ]
  then
    echo "wildfly-${1}.Final.zip"
    curl -OL --progress-bar "${WILDFLY_BASE_URL}/${1}.Final/wildfly-${1}.Final.zip"
  fi
  extract "wildfly-${1}.Final.zip"
  start "wildfly-${1}.Final"
  cleanup
}

extract() {
  mkdir -p /tmp/install.$$
  mv "$1" /tmp/install.$$
  cd /tmp/install.$$
  unzip /tmp/install.$$/$1
}

start()
{
  /tmp/install.$$/$1/bin/standalone.sh
}

cleanup()
{
  rm -f /tmp/install.$$
}

read -p "Qual versão do WildFly você deseja fazer download: " version
wildfly "$version"
