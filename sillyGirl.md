* [sillyGirl 教程](#sillygirl-教程)
   * [安装](#安装)
      * [方法一：Docker 部署（推荐）](#方法一docker-部署推荐)
      * [方法二：本机部署](#方法二本机部署)
   * [使用](#使用)
      * [QQ](#qq)
      * [Telegram](#telegram)
      * [微信公众号](#微信公众号)
         * [sillyGirl 设置](#sillygirl-设置)
         * [公众号后台设置](#公众号后台设置)
         * [公众号无权限](#公众号无权限)
      * [青龙](#青龙)
      * [短信登录](#短信登录)
   * [指令大全](#指令大全)
      * [机器人](#机器人)
         * [QQ 机器人相关](#qq-机器人相关)
         * [Telegram 机器人相关](#telegram-机器人相关)
         * [微信公众号相关](#微信公众号相关)
      * [青龙相关](#青龙相关)
      * [Jd_cookie 相关](#jd_cookie-相关)
      * [短信登录相关](#短信登录相关)
   * [杂项](#杂项)
   * [软件推荐](#软件推荐)
      * [boltbrowser](#boltbrowser)

# sillyGirl 教程

## 安装

### 方法一：Docker 部署（推荐）

[看这里](./README.md)

### 方法二：本机部署

**前提条件：Git、Golang**

1. 克隆主仓库： git clone https://github.com/cdle/sillyGirl
2. 在 sillyGirl/develop 目录下运行：git clone https://github.com/ufuckee/jd_cookie
3. 参考 [example_sets.conf](./conf/example_sets.conf) 设置 /etc/sillyGirl/sets.conf
4. 在 sillyGirl 目录下新建文件 dev.go 内容如下

  ```go
 package main
 
 import (
  //青龙2.9
  _ "github.com/cdle/sillyGirl/develop/qinglong"
  //京东
  _ "github.com/cdle/sillyGirl/develop/jd_cookie"
  //qq机器人
  _ "github.com/cdle/sillyGirl/im/qq"
  //tg机器人
  _ "github.com/cdle/sillyGirl/im/tg"
  //微信公众号
  _ "github.com/cdle/sillyGirl/im/wxmp"
 
 )
 
 
  ```

4. 在 sillyGirl 目录下运行 go build
5. 在 sillyGirl 目录下运行 ./sillyGirl 

## 使用

**启动后控制台会打印出二维码，请使用QQ机器人的QQ扫码登录（QQ没有专门的机器人，这里指的你的QQ小号）**

**该QQ机器人账号拥有管理员权限**  

**遇到提示“没有权限”时，请使用管理员账号，或者QQ机器人账号**

### QQ

**设置qq管理员（可多个，使用“&”连接）：**

- set qq masters qq1&qq2&qq3

### Telegram

**设置机器人token（可多个，使用“&”连接）：**

- set tg token xxxxx

**设置tg管理员(tg账号id 可以使用这个机器人获取ID @getuseridbot)：**

- set tg masters xxxxx

**设置 tg bot 代理：**

- set tg url xxxxx

### 微信公众号

#### sillyGirl 设置

- set wxmp app_id xxxxxx（公众号后台获取）

- set wxmp app_secret xxxxxx （公众号后台获取）

- set wxmp encoding_aes_key xxxxxx（随便填，要与后面公众号后台设置一致）

- set wxmp token xxxxxx（随便填，要与后面公众号后台设置一致）

**将 sillGirl 的端口设置为80或者443,或者使用反向代理**

- set sillyGirl port 80

#### 公众号后台设置

1. 在公众号后台 https://mp.weixin.qq.com/  开启开发者
2. 在 开发-基本配置 中 获取 AppID AppSecret
3. 在 开发-基本配置 中 把你的服务器 ip 添加到 IP白名单
4. 在 开发-基本配置-服务器配置-修改配置

- url: http://你的ip/wx

- Token：随便填 对应 SillyGirl 的 wxmp token

- EncodingAESKey：随便填 对应 SillyGirl 的 wxmp encoding_aes_key

- 消息加解密方式：明文模式

5. 提交并启用

 **sillyGirl 必须已设置好上面的参数，且处于运行状态，确保你的 http://你的ip/wx/ 外网能访问到，不然会校验失败**

**注意：本人在 oracle x86 ubuntu 上使用直接部署 sillyGirl 外网访问不到服务 http://你的ip/wx/。**

**在这台 oracle x86 ubuntu 上使用 Docker 部署 sillyGirl 外网能访问到服务 http://你的ip/wx/。**

**原因未知 有知道的，请告诉我**

#### 公众号无权限

1. 发送 myuid 获取你的 openid
2. set wxmp masters openid（可多个，使用“&”连接）

### 青龙

**请先到青龙 系统设置-应用设置添加应用**

**设置青龙地址**

- set qinglong host http://xxxxxx:xx

**设置青龙 client_id**

- set qinglong client_id  xxxxxx

**设置青龙 client_secret**

- set qinglong client_secret xxxxx

**设置完成后，重启 sillyGirl，重启青龙**

**若连接不上青龙，可以尝试，删掉青龙容器，更新镜像，重建容器**

### 短信登录

**个人没需求，自行摸索**

## 指令大全

**升级**

更新 sillyGirl

**重启**

重启 sillyGirl 并后台运行

**命令**

获取 sillyGirl 的命令列表

**myuid**

获取你的id

**查询**

查询绑定账号资产

可查询指定账号资产（查询 1、查询 2、查询 2-5）

**资产推送**

给对应绑定账号发送资产信息

**更新狗东账号**

转换 wskey 到 cookie

### 机器人

**解除指定账号关联的一切账号：（貌似没效果）**

- jd unbind im账号

**指定系统通知发送对象：**

- set [im type] notifiers [accounts join by '&'] 

#### QQ 机器人相关

**绑定京东账号与 qq（可由各自账号给机器人发 cookie 会自动把cookie和账号绑定）：**

- set pinQQ 京东账号pt_pin QQ号

**取消绑定：**

- delete pinQQ 京东账号pt_pin

**设置QQ监听指定群聊消息（不指定则监听所有群聊）：**

- set qq groupCode 群号

**注销qq机器人登录（用于更换QQ机器人账号）：** 

- delete qq session.token

**禁用自己回复自己（请设置好管理员账号再禁用）**：

- set qq onself false
- 重启

**QQ机器人自动通过好友申请请求：**

- set qq auto_friend true

#### Telegram 机器人相关

**绑定京东账号与 Telegram（可由各自账号给机器人发 cookie 会自动把cookie和账号绑定）：**

- set pinTG 京东账号pt_pin Telegram账号

**取消绑定：**

- delete pinTG 京东账号pt_pin

#### 微信公众号相关

**绑定京东账号与 微信号（可由各自账号给机器人发 cookie 会自动把cookie和账号绑定）：**

- set pinWXMP 京东账号pt_pin 微信openid

给公众号发送 myuid 可获取微信 openid

**取消绑定：**

- delete pinWXMP 京东账号pt_pin

### 青龙相关

**关闭自动隐藏任务命令：**

- set qinglong autoCronHideDuplicate false

### Jd_cookie 相关

**设置wskey自动转cooke定时：**

- set jdWSCK update 56 * * * *

### 短信登录相关

**短信登录设置坑位数：**

-  set jd_cookie login_num xxxxx

**短信登录设置jd-qinglong地址：**

- set jd_cookie address xxxxx

## 杂项

**sillyGirl 后台运行时怎么停止运行**

-  ps -A | grep sillyGirl

-  kill -9 xxxxxx (xxxxxx为上面输出的数字)

## 软件推荐

### boltbrowser

一个命令行 boltDB 浏览器 可用于查看管理 sillyGirl.cache

**安装方法：**go install github.com/br0xen/boltbrowser@2.1 

**使用方法：**boltbrowser <filename>

![](https://camo.githubusercontent.com/323c8ce1cd61320b453c6d3978ee15c241fbe2affeefde994018217c2feac0d7/687474703a2f2f62756c6c6572636f6465776f726b732e636f6d2f626f6c7462726f777365722f7373322e706e67)

**注意：**遇到 “File sillyGirl.cache is locked. Make sure it's not used by another app and try again”时 可杀掉sillyGirl 再使用

