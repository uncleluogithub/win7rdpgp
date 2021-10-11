apt-get update
echo "同学们，朋友们，罗叔变戏法开始了！~现在在下载Windows文件中，请等候约1分钟左右时间..."
wget -O win7.img https://link.jscdn.cn/sharepoint/aHR0cHM6Ly9jYW1wdXNtY2NkLW15LnNoYXJlcG9pbnQuY29tLzp1Oi9nL3BlcnNvbmFsL2xpbmRhX3JpY2hfY2FtcHVzX21jY2RfZWR1L0VSTW5BdjZUVDlsRnNPYzljSGJhaVZJQjN0dHdQM0RzZDZ1OGFBTXpYa0c3N2c_ZT1WWmEyUng.img
echo "朋友们！下载ngrok远程连接组件中..."
wget https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-amd64.zip > /dev/null 2>&1
unzip ngrok-stable-linux-amd64.zip > /dev/null 2>&1
read -p "粘贴key在这里，最后记得按回车确认，先请各位按下Ctrl + V来粘贴在ngrok网站中所复制的Authtoken: " CRP 
./ngrok authtoken $CRP 
nohup ./ngrok tcp 3388 &>/dev/null &
echo 三天两头跟着老罗叔叔一起薅羊毛是不是感觉很爽？：）
apt-get install qemu-system-x86 -y
echo "这个时候去厨房倒点水喝喝，多喝水有益健康哦~"
echo "开始轮到咱们中文版的Windows发功了！~"
qemu-system-x86_64 -hda win7.img -m 4G -smp cores=4 -net user,hostfwd=tcp::3388-:3389 -net nic -object rng-random,id=rng0,filename=/dev/urandom -device virtio-rng-pci,rng=rng0 -vga vmware -nographic &>/dev/null &
clear
echo 请复制这个远程桌面RDP登录地址:
curl --silent --show-error http://127.0.0.1:4040/api/tunnels | sed -nE 's/.*public_url":"tcp:..([^"]*).*/\1/p'
echo "===================================="
echo "用户名: Administrator"
echo "密码: uncleluo"
echo "===================================="
echo "===================================="
echo "感谢您持续关注+-Uncle LUO老罗叔叔的数字化生活-+YouTube频道"
echo "你快要获得了Windows远程桌面连接了..."
echo "再等待2分钟左右的时间等待系统完成最后一个配置吧~"
echo "你可以关闭本标签栏，但不要忘记关注我的YouTube频道，有及时更新需求请打开小铃铛哦！~"
echo "请悉知：本远程桌面每个Github账户每个月只有50小时的运行时间哦~"
echo "===================================="
sleep 432000
