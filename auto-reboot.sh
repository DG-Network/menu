#!/bin/bash

if [ ! -e /usr/local/bin/reboot_otomatis ]; then
echo '#!/bin/bash' > /usr/local/bin/reboot_otomatis 
echo 'tanggal=$(date +"%m-%d-%Y")' >> /usr/local/bin/reboot_otomatis 
echo 'waktu=$(date +"%T")' >> /usr/local/bin/reboot_otomatis 
echo 'echo "Server telah berhasil direboot pada tanggal $tanggal pukul $waktu." >> /root/log-reboot.txt' >> /usr/local/bin/reboot_otomatis 
echo '/sbin/shutdown -r now' >> /usr/local/bin/reboot_otomatis 
chmod +x /usr/local/bin/reboot_otomatis
fi

echo "=#=#=#==#=#=#==#=#=#==#=#=#==#=#=#==#=#=#=" | lolcat
echo "        Menu Sistem Reboot Otomatis" | lolcat
echo "=#=#=#==#=#=#==#=#=#==#=#=#==#=#=#==#=#=#=" | lolcat
echo "1.  Set Auto-Reboot VPS 1 jam sekali" | lolcat
echo "2.  Set Auto-Reboot VPS 6 jam sekali" | lolcat
echo "3.  Set Auto-Reboot VPS 12 jam sekali" | lolcat
echo "4.  Set Auto-Reboot VPS 1 hari sekali" | lolcat
echo "5.  Set Auto-Reboot VPS 1 minggu sekali" | lolcat
echo "6.  Matikan Auto-Reboot" | lolcat
echo "7.  Lihat log reboot" | lolcat
echo "8.  Hapus log reboot" | lolcat
echo "=#=#=#==#=#=#==#=#=#==#=#=#==#=#=#==#=#=#=" | lolcat
read -p "Tulis Pilihan Anda (angka): " x

if test $x -eq 1; then
echo "10 * * * * root /usr/local/bin/reboot_otomatis" > /etc/cron.d/reboot_otomatis
clear
echo "                                INFO !!!
          Auto-Reboot VPS 1 jam sekali telah berhasil di terapkan" | boxes -d capgirl | lolcat
elif test $x -eq 2; then
echo "10 */6 * * * root /usr/local/bin/reboot_otomatis" > /etc/cron.d/reboot_otomatis
clear
echo "                                  INFO !!!
          Auto-Reboot VPS 6 jam sekali telah berhasil di terapkan" | boxes -d girl | lolcat
elif test $x -eq 3; then
echo "10 */12 * * * root /usr/local/bin/reboot_otomatis" > /etc/cron.d/reboot_otomatis
clear
echo "                                  INFO !!!
          Auto-Reboot VPS 12 jam sekali telah berhasil di terapkan" | boxes -d capgirl | lolcat
elif test $x -eq 4; then
echo "10 0 * * * root /usr/local/bin/reboot_otomatis" > /etc/cron.d/reboot_otomatis
clear
echo "                                  INFO !!!
          Auto-Reboot VPS 1 hari sekali telah berhasil di terapkan" | boxes -d girl | lolcat
elif test $x -eq 5; then
echo "10 0 */7 * * root /usr/local/bin/reboot_otomatis" > /etc/cron.d/reboot_otomatis
clear
echo "                                  INFO !!!
          Auto-Reboot VPS 1 minggu sekali telah berhasil di terapkan" | boxes -d capgirl | lolcat
elif test $x -eq 6; then
rm -f /etc/cron.d/reboot_otomatis
echo "                     INFO !!!
          Auto-Reboot VPS telah dimatikan." | boxes -d girl | lolcat
elif test $x -eq 7; then
if [ ! -e /root/log-reboot.txt ]; then
	echo "                         INFO !!!
          VPS Anda Belum Diterapkan Auto-Reboot" | boxes -d capgirl | lolcat
	else 
	echo 'LOG REBOOT'
	echo "-------"
	cat /root/log-reboot.txt
fi
elif test $x -eq 8; then
echo "" > /root/log-reboot.txt
clear
echo "                     INFO !!!
          Log Auto Reboot berhasil dihapus!" | boxes -d girl | lolcat
else
echo "Pilihan Tidak Terdapat Di Menu." | boxes -d capgirl | lolcat
exit
fi