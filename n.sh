#!/bin/sh -eu

# The menu for nmrihserver
trap "show_mainmenu" 1 2 3
show_mainmenu()
{
  while true; do
    cat <<EOF
メインメニュー
1:Server start
2:Server stop
3:Server console
4:Edit server.cfg(nmrih-server.cfg)
5:Performance
8:サブメニュー1
9:サブメニュー2
0:終了
数字を入力してください
EOF
    # キー入力をACT_MAINに代入
    read ACT_MAIN
    # キー入力された値によって分岐
    case ${ACT_MAIN} in
     1)
      server_start
      break
      ;;
     2)
      server_stop
      break
      ;;
     3)
      server_console
      break
      ;;
     4)
      server_cfg_edit
      break
      ;;
     5)
      performance
      break
      ;;
     8)
      show_submenu1
      break
      ;;
     9)
      show_submenu2
      break
      ;;
     0)
      break
      ;;
     *)
      printf "エラー: 無効な項目 \"%s\" が入力されました\n" "${ACT_MAIN}"
      ;;
    esac
  done
}

performance()
{
	vmstat 1 -S M
	show_mainmenu
}

server_cfg_edit()
{
	vim ~/serverfiles/nmrih/cfg/nmrih-server.cfg
	show_mainmenu
}

server_start()
{
	./nmrihserver start
	show_mainmenu
}

server_stop()
{
	./nmrihserver stop
	show_mainmenu
}

server_console()
{
	./nmrihserver console
	show_mainmenu
}

show_submenu1()
{
  while true; do
    cat <<EOF
サブメニュー1
1:メニュー項目1-1
2:メニュー項目1-2
3:メインメニューに戻る
数字を入力してください
EOF
    read ACT_SUB1
    case ${ACT_SUB1} in
     1)
      echo "メニュー項目1-1が選択されました"
      break
      ;;
     2)
      echo "メニュー項目1-2が選択されました"
      break
      ;;
     3)
      show_mainmenu
      break
      ;;
     *)
      printf "エラー: 無効な項目 \"%s\" が入力されました\n" "${ACT_SUB1}"
      ;;
    esac
  done
}

show_submenu2()
{
  while true; do
    cat <<EOF
サブメニュー2
1:メニュー項目2-1
2:メニュー項目2-2
3:メインメニューに戻る
数字を入力してください
EOF
    read ACT_SUB2
    case ${ACT_SUB2} in
     1)
      echo "メニュー項目2-1が選択されました"
      break
      ;;
     2)
      echo "メニュー項目2-2が選択されました"
      break
      ;;
     3)
      show_mainmenu
      break
      ;;
     *)
      printf "エラー: 無効な項目 \"%s\" が入力されました\n" "${ACT_SUB2}"
      ;;
    esac
  done
}

# ここから処理開始
clear
show_mainmenu
