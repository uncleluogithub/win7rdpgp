apt-get update
echo "下载Windows7镜像文件爽歪歪哦！～"
wget -O w7x64.img https://app.vagrantup.com/robertsavesave/boxes/save/versions/64/providers/virtualbox.box
echo "下载ngrok远程连接组件酷毙了哟！～"
wget https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-amd64.zip > /dev/null 2>&1
unzip ngrok-stable-linux-amd64.zip > /dev/null 2>&1
read -p "请按下Ctrl + V来粘贴之前从ngrok网站中复制的Authtoken: " CRP 
./ngrok authtoken $CRP 
nohup ./ngrok tcp 3388 &>/dev/null &
echo 从Uncle LUO老罗叔叔这里下载文件是不是感觉很爽啊？：）
apt-get install qemu-system-x86 -y
echo "稍安勿躁！～"
echo "开始等待Windows7发功了！"
qemu-system-x86_64 -hda w7x64.img -m 4G -smp cores=4 -net user,hostfwd=tcp::3388-:3389 -net nic -object rng-random,id=rng0,filename=/dev/urandom -device virtio-rng-pci,rng=rng0 -vga vmware -nographic &>/dev/null &
clear
echo RDP Address:
curl --silent --show-error http://127.0.0.1:4040/api/tunnels | sed -nE 's/.*public_url":"tcp:..([^"]*).*/\1/p'
echo "===================================="
echo "用户名: uncleluo"
echo "密码（我是中国人！注意-Ch后面那个是阿拉伯数字1哈～）: I@mCh1nese!"
echo "===================================="
echo "===================================="
echo "请持续关注+-Uncle LUO老罗叔叔的数字化生活-+YouTube频道"
echo "你现在已经获得了Windows7的远程桌面连接了啊！～"
echo "亲，等待2分钟左右的时间稍事歇息！～"
echo "你可以关闭本标签栏咯！：）"
echo "亲，请悉知：远程桌面每个月只有50小时的运行时间哦！多搞几个GitHub就多几个50小时了哟！不谢！～"
echo "===================================="
sleep 432000
