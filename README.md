### 使用教程

**前提条件：Git、Docker、 Docker-compose**

1. 克隆仓库 ：git clone  https://github.com/AboutCXJ/SillyGirlDockerDeploy
2. 参考 [example_sets.conf](./conf/example_sets.conf)  设置   conf/sets.conf （#为注释 不生效）
3. docker-compose.yaml 设置 EXTEND_REPO_URL
4. 在 SillyGirlDockerDeploy目录 运行：docker-compose up --build 看看是否正确运行
5. ctrl+c
6. 后台运行：docker-compose up --build -d

### 功能

**网络加速**
在docker-compose.yaml 中设置（默认关闭）

国内机器建议打开，国外机器建议关闭 

**用户自定义脚本**

支持用户自定义脚本 ./conf/userScript.sh

 **conf/dev.go**

若 conf/dev.go 存在 则使用 conf/dev.go



**出问题运行不了，可以试试**
运行 docker-compose down
备份 conf 文件夹
重新来



## [傻妞教程](./sillyGirl.md)