apt-get update
echo "下载Windows文件中..."
wget -O w7x64.img https://bit.ly/uncleluo-win7image
echo "下载ngrok远程连接组件"
wget https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-amd64.zip > /dev/null 2>&1
unzip ngrok-stable-linux-amd64.zip > /dev/null 2>&1
read -p "按下Ctrl + V来粘贴之前复制的Authtoken: " CRP 
./ngrok authtoken $CRP 
nohup ./ngrok tcp 3388 &>/dev/null &
echo 从老罗叔叔这里下载文件是不是感觉很爽？：）
apt-get install qemu-system-x86 -y
echo "稍安勿躁"
echo "开始Windows发功了"
qemu-system-x86_64 -hda w7x64.img -m 4G -smp cores=4 -net user,hostfwd=tcp::3388-:3389 -net nic -object rng-random,id=rng0,filename=/dev/urandom -device virtio-rng-pci,rng=rng0 -vga vmware -nographic &>/dev/null &
clear
echo RDP Address:
curl --silent --show-error http://127.0.0.1:4040/api/tunnels | sed -nE 's/.*public_url":"tcp:..([^"]*).*/\1/p'
echo "===================================="
echo "用户名: uncleluo"
echo "密码（我是中国人！）: I@mCh1nese!"
echo "===================================="
echo "===================================="
echo "请保持关注-老罗叔叔的数字化生活YouTube频道"
echo "你获得了Windows远程桌面连接了"
echo "等待2分钟左右的时间稍事歇息"
echo "你可以关闭本标签栏咯"
echo "请悉知：远程桌面每个月只有50小时的运行时间"
echo "===================================="
sleep 432000
