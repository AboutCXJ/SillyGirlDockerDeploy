## 使用教程

**前提条件：Git、Docker、 Docker-compose**

1. 克隆仓库 ：git clone  https://github.com/AboutCXJ/SillyGirlDockerDeploy
2. 参考 SillyGirlDockerDeploy/conf/example_sets.conf 设置   SillyGirlDockerDeploy/conf/sets.conf
3. 在 SillyGirlDockerDeploy目录 运行：docker-compose up --build 看看是否正确运行
4. ctrl+c
5. 后台运行：docker-compose up --build -d


*配置了 Golang、 github、 apline apk 加速国内机器建议打开，国外机器建议关闭 在docker-compose.yaml 中设置*

*支持用户自定义脚本 ./conf/userScript.sh*

**出问题运行不了，试试删除 SillyGirlDockerDeploy/code 文件夹 在 SillyGirlDockerDeploy 下运行 docker-compose down**



## [傻妞教程](./sillyGirl.md)