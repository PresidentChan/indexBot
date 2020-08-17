#!/bin/bash

serviceName="index-bot"


if [ "$1" == "init" ]; then
  echo -e "\033[32m init \033[0m"

  echo "create service"

  cat >/etc/systemd/system/$serviceName.service <<EOF
[Unit]
Description=$serviceName
After=network.target
Wants=network.target

[Service]
Type=simple
WorkingDirectory=$(readlink -e ./)
ExecStart=/bin/bash $0 run
Restart=on-failure
RestartPreventExitStatus=100

[Install]
WantedBy=multi-user.target
EOF

  sudo systemctl daemon-reload

  echo "enable service"

  sudo systemctl enable $serviceName &>/dev/null

elif [[ "$1" == "start" || "$1" == "restart" || "$1" == "stop"|| "$1" == "enable"|| "$1" == "disable" ]]; then
  echo -e "\033[32m $1 \033[0m"
  sudo systemctl "$1" $serviceName
  #  bash $0 log
  echo "finish"
elif [ "$1" == "upgrade" ]; then
  echo -e "\033[32m upgrade \033[0m"
  sudo systemctl stop $serviceName
  git pull
  sudo mvn clean
  bash $0 start
elif [ "$1" == "run" ]; then
  echo -e "\033[32m run \033[0m"
  mvn install
  # move bot.json file to application folder
  cp bot.json target/
  java -jar $(readlink -e ./)/target/indexbot-1.1.jar
elif [ "$1" == "help" ]; then
  echo -e "\033[36m =========================== \033[0m"
  echo -e "\033[36m Automated deployment script \033[0m"
  echo -e "\033[36m =========================== \033[0m"
  echo -e "\033[32m init \033[0m: Registration the indexBot service"
  echo -e "\033[32m start/restart/stop \033[0m: Operate the indexBot service"
  echo -e "\033[32m enable/disable \033[0m: Manage automatically service"
  echo -e "\033[32m upgrade \033[0m: Update project & rebuild & restart indexBot"
  echo -e "\033[32m log \033[0m: Show log"
  echo -e "\033[36m =========================== \033[0m"
  echo
elif [ "$1" == "log" ]; then
  journalctl -u $serviceName -o short --no-hostname -f -n 40
else
  echo "$1: command not found   ----bot.sh"
fi
