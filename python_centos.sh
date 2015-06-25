
cd /opt/software

yum install -y zlib-devel bzip2-devel openssl-devel xz-libs wget

wget http://www.python.org/ftp/python/2.7.8/Python-2.7.8.tar.xz
xz -d Python-2.7.8.tar.xz
tar -xf Python-2.7.8.tar

# 进入目录:
cd Python-2.7.8
# 运行配置 configure:
./configure --prefix=/usr/local
# 编译安装:
make
make install
# 检查 Python 版本:
python2.7 -V

ln -s /usr/local/bin/python2.7  /usr/bin/python

# 检查
python -V

#获取软件包
wget --no-check-certificate https://pypi.python.org/packages/source/s/setuptools/setuptools-1.4.2.tar.gz
# 解压:
tar -zxf setuptools-1.4.2.tar.gz
cd setuptools-1.4.2
# 使用 Python 2.7.8 安装 setuptools
python2.7 setup.py install

curl https://raw.githubusercontent.com/pypa/pip/master/contrib/get-pip.py | python2.7 -


#修改 yum中的python 
sed -i '1c #!/usr/bin/python2.6' /usr/bin/yum