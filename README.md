# indexBot
Telegram group/channel/bot index bot  
Telegram 索引导航机器人  
公共实例：[TGX-索引秘书](https://t.me/zh_secretary_bot)

## 部署
#### 1.安装依赖
```shell script
sudo apt install git maven default-jdk -y
```
#### 2.获取本仓库源码
```shell script
git clone git@github.com:Scomarlf/indexBot.git
cd indexBot
```
#### 3.配置bot
复制一份_conf.json文件并重命名为conf.json，编辑conf.json文件，配置其信息
```
{
  "bot": {
    "bot_token": 通过 @BotFather 获取
    "bot_username": bot用户名（不包含“@”符号）
    "creater": bot 创建者
  },
  "database": {
    "url": 数据库链接
    "username": 数据库登录用户名
    "password": 数据库登录密码
  }
}
```
#### 4.运行
```shell script
chmod +x bot.sh && sudo ./bot.sh run
```
#### 5.管理
通过 `./bot.sh help` 可以查看以下内容  
`./bot.sh run` 编译并运行  
`./bot.sh init` 注册 systemd 服务  
`./bot.sh <start/stop/restart>` 启动/停止/重启 服务  
`./bot.sh <enable/disable>` 启用/禁用 自启服务  
`./bot.sh upgrade` 更新并重启服务  
`./bot.sh log` 实时日志  