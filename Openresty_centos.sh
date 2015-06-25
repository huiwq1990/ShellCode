
SoftwareRepo=/opt/software
mkdir ${SoftwareRepo}

OpenrestyVersion=1.7.4.1
OpenrestyZipFile=ngx_openresty-${OpenrestyVersion}.tar.gz 
OpenrestyFilePath=

if [ ! -f "$myFile" ]; then 
	wget_result=$(wget http://openresty.org/download/${OpenrestyZipFile})
	if [ $? -ne 0 ]
	then 
		echo "File Not Found"
		exit
	else 
		echo "Download OK"
		mv ${OpenrestyZipFile} ${SoftwareRepo}
	fi
fi


tar -xvf ngx_openresty-1.7.4.1.tar.gz
cd ngx_openresty-1.7.4.1
./configure
make && make install

## download dependency
yum install -y gcc gcc-c++ readline-devel pcre-devel openssl-devel tcl perl

