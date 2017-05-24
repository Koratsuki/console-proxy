    #!/bin/bash

    function do_proxy(){
      echo -n “Proxy: ”
      read -e internet_proxy
      echo -n “Port: ”
      read -e proxy_port
      echo -n “User: ”
      read -e username
      echo -n “Pass: ”
      read -es password
      export http_proxy=”http://$username:$password@$internet_proxy:$proxy_port/”
      export https_proxy=”http://$username:$password@$internet_proxy:$proxy_port/”
      export ftp_proxy=”http://$username:$password@$internet_proxy:$proxy_port/”
      export no_proxy=”localhost,127.0.0.1,localaddress,.localdomain.com”
      echo -e “\nProxy environment variable set\n”
    }

    function undo_proxy(){
      unset http_proxy
      unset https_proxy
      unset ftp_proxy
      echo -e “\nProxy environment variable removed\n”
    }

    case “$1” in
      on)
      do_proxy
    ;;

    off)
      undo_proxy
    ;;

    *)
      echo -e “\nUsage: proxy_settings {on|off}\n”
      exit 1
    esac

    exit 0
