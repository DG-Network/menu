#!/bin/bash
clear

# get the VPS IP
#ip=`ifconfig venet0:0 | grep 'inet addr' | awk {'print $2'} | sed s/.*://`
MYIP=`ifconfig | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | grep -Eo '([0-9]*\.){3}[0-9]*' | grep -v '127.0.0' | head -n1`;
#MYIP=$(ifconfig | grep 'inet addr:' | grep -v inet6 | grep -vE '127\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}' | cut -d: -f2 | awk '{ print $1}' | head -1)
if [ "$MYIP" = "" ]; then
	MYIP=$(wget -qO- ipv4.icanhazip.com)
fi

#vps="zvur";
vps="aneka";

#if [[ $vps = "zvur" ]]; then
#source="http://"
#else
source="https://raw.githubusercontent.com/DG-Network"
#fi

# check registered ip
wget -q -O IP $source/register/daftar-IP.txt
if ! grep -w -q $MYIP IP; then
echo "Maaf, hanya IP yang terdaftar yang bisa menggunakan SCRIPT ini!"
if [[ $vps = "zvur" ]]; then
echo "Hubungi Admin DG-Network: SoelHadi_Newbie (WhatsApp: 087864334333)"
else
echo "Hubungi Admin DG-Network: SoelHadi_Newbie (WhatsApp: 087864334333)"
fi
rm -f /root/IP
exit
fi
#myip=`ifconfig | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | grep -Eo '([0-9]*\.){3}[0-9]*' | grep -v '127.0.0' | head -n1`;

flag=0

echo

	#MYIP=$(ifconfig | grep 'inet addr:' | grep -v inet6 | grep -vE '127\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}' | cut -d: -f2 | awk '{ print $1}' | head -1)
	#if [ "$MYIP" = "" ]; then
		#MYIP=$(wget -qO- ipv4.icanhazip.com)
	#fi

	clear

	#echo "--------------- Selamat datang di Server - IP: $MYIP ---------------"
	echo ""
	echo ""
	echo ""
	echo ""
	echo ""
	echo ""
	echo ""
	echo ""
	echo ""
	#cname=$( awk -F: '/model name/ {name=$2} END {print name}' /proc/cpuinfo )
	#cores=$( awk -F: '/model name/ {core++} END {print core}' /proc/cpuinfo )
	#freq=$( awk -F: ' /cpu MHz/ {freq=$2} END {print freq}' /proc/cpuinfo )
	#tram=$( free -m | awk 'NR==2 {print $2}' )
	#swap=$( free -m | awk 'NR==4 {print $2}' )
	#up=$(uptime|awk '{ $1=$2=$(NF-6)=$(NF-5)=$(NF-4)=$(NF-3)=$(NF-2)=$(NF-1)=$NF=""; print }')

	#echo -e "\e[032;1mCPU model:\e[0m $cname"
	#echo -e "\e[032;1mNumber of cores:\e[0m $cores"
	#echo -e "\e[032;1mCPU frequency:\e[0m $freq MHz"
	#echo -e "\e[032;1mTotal amount of ram:\e[0m $tram MB"
	#echo -e "\e[032;1mTotal amount of swap:\e[0m $swap MB"
	#echo -e "\e[032;1mSystem uptime:\e[0m $up"
lolcat -F 0.3 -S 0 /usr/bin/bannermenu
echo "                                    Server: $MYIP" | lolcat
date +"                                       %A, %d-%m-%Y" | lolcat
date +"                                          %H:%M:%S %Z" | lolcat
echo ""
echo ""
PS3='Silahkan ketik nomor pilihan anda kemudian tekan ENTER: '
options=("Create Akun SSH/OpenVPN" "Create Akun Trial" "Perpanjang Masa Aktif User" "Ganti Password Akun SSH/OpenVPN" "Daftar Akun Dan Expired" "Hapus Akun" "Monitoring Akun Dan Tendang" "Monitor Akun Login" "Daftar Akun Aktif" "Daftar Akun Expired" "Disable Akun Expired" "Hapus Akun Expired" "Banned Akun" "Unbanned Akun" "Informasi RAM" "Speedtest" "Benchmark" "Nonaktifkan Auto Kill Multi Login" "Aktifkan Auto Kill Multi Login" "Ganti Password VPS" "Bersihkan Cache AM" "Edit Banner SSH" "Edit Banner Menu" "Restart Webmin" "Restart VPS" "Restart Dropbear" "Restart OpenSSH" "Restart Squid Proxy" "Restart OpenVPN" "Ganti Port OpenSSH" "Ganti Port Dropbear" "Ganti Port Squid Proxy" "Ganti Port OpenVPN" "Quit")
select opt in "${options[@]}"
do
    case $opt in
        "Create Akun SSH/OpenVPN")
	clear
        user-add
        break
            ;;
	"Create Akun Trial")
	clear
	user-gen
	break
	;;
	"Perpanjang Masa Aktif Akun")
	clear
	user-renew
	break
	;;
	"Ganti Password Akun SSH/OpenVPN")
	clear
	user-pass
	break
	;;
	"Daftar Akun Dan Expired")
	clear
	user-list | boxes -d parchment | lolcat
	break
	;;
	"Hapus Akun")
	clear
	user-del
	break
	;;
	"Monitoring Akun Dan Tendang")
	clear
	dropmon
	break
	;;
	"Monitor Akun Login")
	clear
	user-login
	break
	;;
	"Non-Aktifkan Auto Kill Multi Login")
	clear
        rm -rf /etc/cron.d/userlimit1
	rm -rf /etc/cron.d/userlimit2
	rm -rf /etc/cron.d/userlimit3
	rm -rf /etc/cron.d/userlimit4
	rm -rf /etc/cron.d/userlimit5
	rm -rf /etc/cron.d/userlimit6
	rm -rf /etc/cron.d/userlimitreboot
	service cron restart
		service ssh restart
		service dropbear restart
	clear
	echo ""
	echo "                 AUTO KILL LOGIN has been INACTIVATED !!!" | boxes -d girl | lolcat
	echo "-_-_-_-_-__-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-__-_-_-_-_-_-_-_-" | lolcat
	break
	;;
	"Aktifkan Auto Kill Multi Login")
	read -p "Isikan Maximal User Login (1-2): " MULTILOGIN2
	#echo "@reboot root /root/userlimit.sh" > /etc/cron.d/userlimitreboot
	echo "* * * * * root /usr/bin/userlimit.sh $MULTILOGIN2" > /etc/cron.d/userlimit1
	echo "* * * * * root sleep 10; /usr/bin/userlimit.sh $MULTILOGIN2" > /etc/cron.d/userlimit2
	echo "* * * * * root sleep 20; /usr/bin/userlimit.sh $MULTILOGIN2" > /etc/cron.d/userlimit3
	echo "* * * * * root sleep 30; /usr/bin/userlimit.sh $MULTILOGIN2" > /etc/cron.d/userlimit4
	echo "* * * * * root sleep 40; /usr/bin/userlimit.sh $MULTILOGIN2" > /etc/cron.d/userlimit5
	echo "* * * * * root sleep 50; /usr/bin/userlimit.sh $MULTILOGIN2" > /etc/cron.d/userlimit6
	#echo "@reboot root /root/userlimitssh.sh" >> /etc/cron.d/userlimitreboot
	echo "* * * * * root /usr/bin/userlimitssh.sh $MULTILOGIN2" >> /etc/cron.d/userlimit1
	echo "* * * * * root sleep 11; /usr/bin/userlimitssh.sh $MULTILOGIN2" >> /etc/cron.d/userlimit2
	echo "* * * * * root sleep 21; /usr/bin/userlimitssh.sh $MULTILOGIN2" >> /etc/cron.d/userlimit3
	echo "* * * * * root sleep 31; /usr/bin/userlimitssh.sh $MULTILOGIN2" >> /etc/cron.d/userlimit4
	echo "* * * * * root sleep 41; /usr/bin/userlimitssh.sh $MULTILOGIN2" >> /etc/cron.d/userlimit5
	echo "* * * * * root sleep 51; /usr/bin/userlimitssh.sh $MULTILOGIN2" >> /etc/cron.d/userlimit6
	service cron restart
	service ssh restart
	service dropbear restart
	echo "                 AUTO KILL LOGIN has been ACTIVATED !!!" | boxes -d capgirl | lolcat
        echo "-_-_-_-_-__-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-__-_-_-_-_-_-_-_-" | lolcat
	break
	;;
	"Bersihkan Cache RAM")
	clear
	echo "Cleaning..." | lolcat
       free -h
	echo 1 > /proc/sys/vm/drop_caches
	sleep 1
	echo 2 > /proc/sys/vm/drop_caches
	sleep 1
	echo 3 > /proc/sys/vm/drop_caches && swapoff -a && swapon -a
	sleep 1
	echo ""
	echo "Finishing..." | lolcat
	free -h
	echo "          DONE....!!! RAM's CACHE has been CLEARED." | boxes -d girl | lolcat
	echo "-_-_-_-_-__-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-__-_-_-_-_-_-_-_-" | lolcat
        break
	;;
	"Daftar Akun Aktif")
	clear
	user-active-list | boxes -d parchment | lolcat
	break
	;;
	"Daftar Akun Expired")
	clear
	user-expire-list | boxes -d parchment |lolcat
	break
	;;
	"Disable Akun Expired")
	clear
	disable-user-expire | lolcat
	break
	;;
	"Hapus Akun Expired")
	clear
	delete-user-expire | lolcat
	break
	;;
	"Banned Akun")
	clear
	banned-user
	break
	;;
	"Unbanned Akun")
	clear
	unbanned-user
	break
	;;
	"Informasi RAM")
	clear
	ps-mem | boxes -d girl | lolcat
	echo "-_-_-_-_-__-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-__-_-_-_-_-_-_-_-" | lolcat
	break
	;;
	"Speedtest")
	clear
	echo "          SPEEDTEST SERVER" | boxes -d capgirl | lolcat
	echo "          -----------------------------------------"
	speedtest --share | lolcat
	echo "-_-_-_-_-__-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-__-_-_-_-_-_-_-_-" | lolcat
	break
	;;
	"Benchmark")
	clear
	echo "          BENCHMARK" | boxes -d girl | lolcat
	benchmark | lolcat
	break
	;;
        "Edit Banner SSH")
	clear
	echo "                    INSTRUCTIONS !!!

          1.) Simpan text (CTRL + X, lalu ketik Y dan tekan Enter)
          2.) Membatalkan edit text (CTRL + X, lalu ketik N dan tekan Enter)" | boxes -d capgirl | lolcat
	echo "-_-_-_-_-__-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-__-_-_-_-_-_-_-_-" | lolcat
	read -p "Tekan ENTER untuk melanjutkan........................ " | lolcat
	nano /bannerssh
	service dropbear restart && service ssh restart
	break
	;;
	"Edit Banner Menu")
	clear
	echo "                    INSTRUCTIONS !!!

          1.) Simpan text (CTRL + X, lalu ketik Y dan tekan Enter)
          2.) Membatalkan edit text (CTRL + X, lalu ketik N dan tekan Enter)" | boxes -d girl | lolcat
	echo "-_-_-_-_-__-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-__-_-_-_-_-_-_-_-" | lolcat
	read -p "Tekan ENTER untuk melanjutkan........................ " | lolcat
	nano /usr/bin/bannermenu
	break
	 ;;
	"Restart Webmin")
	clear
	service webmin restart
	echo "                   INFO !!!

          WEBMIN has been RESTARTED" | boxes -d capgirl | lolcat
	 echo "-_-_-_-_-__-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-__-_-_-_-_-_-_-_-" | lolcat
	break
	;;
	 "Restart VPS")
	 clear
	 reboot
	 echo "                   INFO !!!

             VPS has been RESTARTED" | boxes -d girl | lolcat
	 echo "-_-_-_-_-__-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-__-_-_-_-_-_-_-_-" | lolcat
	 break
	 ;;
	 "Restart Dropbear")
	 clear
	 service dropbear restart
	 echo "                     INFO !!!

          DROPBEAR has been RESTARTED" | boxes -d capgirl | lolcat
	 echo "-_-_-_-_-__-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-__-_-_-_-_-_-_-_-" | lolcat
	 break
	 ;;
	 "Restart OpenSSH")
	 clear
	 service ssh restart
	 echo "                    INFO !!!

          OpenSSH has been RESTARTED" | boxes -d girl | lolcat
	 echo "-_-_-_-_-__-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-__-_-_-_-_-_-_-_-" | lolcat
	 break
	 ;;
	 "Restart OpenVPN")
	 clear
	 service openvpn restart
	 echo "                    INFO !!!

          OpenVPN has been RESTARTED" | boxes -d capgirl | lolcat
	 echo "-_-_-_-_-__-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-__-_-_-_-_-_-_-_-" | lolcat
	 break
	 ;;
	 "Restart Squid Proxy")
	 clear
	 service squid3 restart
	 echo "                   INFO !!!

          SQUID3 has been RESTARTED" | boxes -d girl | lolcat
	 echo "-_-_-_-_-__-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-__-_-_-_-_-_-_-_-" | lolcat
	 break
	 ;;
	 "Ganti Port OpenSSH")
	 clear
			echo "                             INSTRUCTIONS !!!

          1.) Silahkan ganti port OpenSSH anda, lalu klik ENTER
          2.) Port 1 dan Port 2 tidak boleh sama !!!" | boxes -d capgirl | lolcat
			echo "-_-_-_-_-__-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-__-_-_-_-_-_-_-_-" | lolcat
	    echo "Port 1: 22"| lolcat
	    read -p "Port 2: " -e -i 143 PORT
		clear
	    service dropbear stop
	    service ssh stop
	    service openvpn stop
	    sed -i "6s/Port [0-9]*/Port $PORT/" /etc/ssh/sshd_config
        service ssh start 
		service dropbear start
		service openvpn start
		clear
		echo "                   INFO !!!

		OpenSSH Updated Port: $PORT" | boxes -d girl | lolcat
		echo "-_-_-_-_-__-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-__-_-_-_-_-_-_-_-" | lolcat
	 break
         ;;
	 "Ganti Port Dropbear")
	 clear
            echo "                            INSTRUCTIONS !!!

          1.) Silahkan ganti port DROPBEAR anda, lalu klik ENTER
          2.) Port 1 dan Port 2 tidak boleh sama !!!" | boxes -d capgirl | lolcat
			echo "-_-_-_-_-__-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-__-_-_-_-_-_-_-_-" | lolcat
           echo "Port 1: 443 (Default)"
	    read -p "Port 2: " -e -i 80 PORT
		clear
	    service dropbear stop
	    service ssh stop
	    service openvpn stop
            sed -i "s/DROPBEAR_PORT=[0-9]*/DROPBEAR_PORT=$PORT/g" /etc/default/dropbear
	    #sed -i 's/DROPBEAR_EXTRA_ARGS="-p [0-9]*"/DROPBEAR_EXTRA_ARGS="-p 109"/g' /etc/default/dropbear	
            service dropbear start
	    service ssh start
	    service openvpn start
		clear
            echo "                   INFO !!!

		DROPBEAR Updated Port: $PORT" | boxes -d girl | lolcat
		echo "-_-_-_-_-__-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-__-_-_-_-_-_-_-_-" | lolcat
	 break
	 ;;
	 "Ganti Port Squid Proxy")
	 clear
	 echo "                               INSTRUCTIONS !!!

          1.) Silahkan ganti port SQUID PROXY anda, lalu klik ENTER
          2.) Port 1 dan Port 2 tidak boleh sama !!!" | boxes -d capgirl | lolcat
	echo "-_-_-_-_-__-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-__-_-_-_-_-_-_-_-" | lolcat
	    echo -e "Port Squid3 1: 8080"
	    read -p "Port Squid3 2: " -e -i 3128 PORT
		clear
            #sed -i 's/http_port [0-9]*\nhttp_port [0-9]*/http_port $PORT1\nhttp_port $PORT2/g' /etc/squid3/squid.conf
            sed -i "23s/http_port [0-9]*/http_port $PORT/" /etc/squid3/squid.conf
			service squid3 restart
		clear
            echo "                   INFO !!!

		DROPBEAR Updated Port: $PORT" | boxes -d girl | lolcat
		echo "-_-_-_-_-__-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-__-_-_-_-_-_-_-_-" | lolcat
		break		
		;;
	 "Ganti Port OpenVPN")
	 clear
	           echo "                       INSTRUCTION !!!

Silahkan ganti port OpenVPN anda, lalu klik ENTER !!!" | boxes -d capgirl | lolcat
	echo "-_-_-_-_-__-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-__-_-_-_-_-_-_-_-" | lolcat
            read -p "Port: " -e -i 55 PORT
			clear
	    service dropbear stop
	    service ssh stop
	    service openvpn stop
            sed -i "s/port [0-9]*/port $PORT/" /etc/openvpn/server.conf
	    cp /etc/openvpn/client.ovpn /home/vps/public_html/client.ovpn
            sed -i "s/ipserver ports/$MYIP $PORT/g" /home/vps/public_html/client.ovpn
	    sed -i "s/ipserver/$MYIP/g" /home/vps/public_html/client.ovpn
	   service openvpn start
	    service dropbear start
	    service ssh start
		clear
		echo "                  INFO !!!

		OpenVPN Updated Port: $PORT" | boxes -d girl | lolcat
		echo "-_-_-_-_-__-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-__-_-_-_-_-_-_-_-" | lolcat
	 break
	 ;;
	 
	"Quit")
	
	break
	;;
	 
        *) echo Unknown Option, Please Try Again!!!;
	esac
done
