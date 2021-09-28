#!/bin/sh

CONF_DIR=/etc/sillyGirl

if [ -z $CODE_DIR ]; then
  CODE_DIR=/sillyGirl
fi

if [  "$ENABLE_GOPROXY" = "true" ]; then
  export GOPROXY=https://goproxy.io,direct 
  echo "启用 goproxy 加速 ${GOPROXY}"
else
  echo "未启用 goproxy 加速"
fi

if [ "$ENABLE_GITHUBPROXY" = "true" ]; then
   GITHUBPROXY=https://ghproxy.com/
   echo "启用 github 加速 ${GITHUBPROXY}"
else
  echo "未启用 github 加速"
fi

if [ "$ENABLE_APKPROXY" = "true" ]; then
  sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories
  echo "启用 alpine APK 加速 mirrors.aliyun.com"
else
  sed -i 's/mirrors.aliyun.com/dl-cdn.alpinelinux.org/g' /etc/apk/repositories
  echo "未启用 alpine APK 加速"
fi

if [ -z $REPO_URL ]; then
  REPO_URL=${GITHUBPROXY}https://github.com/cdle/sillyGirl.git
fi


if [ -z $EXTEND_REPO_URL ]; then
  EXTEND_REPO_URL=${GITHUBPROXY}https://github.com/ufuckee/jd_cookie.git
fi


if ! type git  >/dev/null 2>&1; then
  echo "正在安装git..."
  apk add git
else 
  echo "git已安装"
fi


if [ ! -d $CODE_DIR/.git ]; then
  echo "sillyGirl 核心代码目录为空, 开始clone代码..."
  git clone $REPO_URL  $CODE_DIR
else 
  echo "sillyGirl 核心代码已存在"
  echo "更新 sillyGirl 核心代码"
  cd $CODE_DIR && git reset --hard && git pull
fi


TMP_EXTEND_REPO_NAME=${EXTEND_REPO_URL##*/}
EXTEND_REPO_NAME=${TMP_EXTEND_REPO_NAME%.*}


if [ ! -d $CODE_DIR/develop/${EXTEND_REPO_NAME}/.git ]; then
    echo "扩展 ${EXTEND_REPO_NAME} 代码目录为空, 开始clone代码..."
    git clone $EXTEND_REPO_URL  $CODE_DIR/develop/${EXTEND_REPO_NAME}
else
  echo "扩展 ${EXTEND_REPO_NAME} 代码已存在"
  echo "更新扩展 ${EXTEND_REPO_NAME} 代码"
  cd $CODE_DIR/develop/${EXTEND_REPO_NAME} && git reset --hard && git pull
fi


if [ -f $CONF_DIR/dev.go ]; then
  cat $CONF_DIR/dev.go > $CODE_DIR/dev.go
fi

if [ ! -f $CODE_DIR/dev.go ]; then
    echo "dev.go 不存在  添加 dev.go"
    cat > $CODE_DIR/dev.go <<EOF
package main

import (
    _ "github.com/cdle/sillyGirl/develop/qinglong"
    _ "github.com/cdle/sillyGirl/develop/jd_cookie"
    _ "github.com/cdle/sillyGirl/im/qq"
    _ "github.com/cdle/sillyGirl/im/wxmp"
    _ "github.com/cdle/sillyGirl/im/tg"
)
EOF

else
  echo "dev.go 已存在  不添加 dev.go"
fi

if [ ! -f $CONF_DIR/userScript.sh ]; then
  echo "userScript.sh 不存在，不执行用户自定义脚本"
else
  echo "userScript.sh 存在，执行用户自定义脚本"
  sh $CONF_DIR/userScript.sh
fi

echo "开始编译..."
cd $CODE_DIR && go build


echo "启动..."
 ./sillyGirl


