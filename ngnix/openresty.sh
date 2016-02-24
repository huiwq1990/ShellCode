

yum install readline-devel pcre-devel openssl-devel gcc

#wget http://sourceforge.net/projects/pcre/files/pcre/8.32/pcre-8.32.tar.gz

wget http://sourceforge.net/projects/pcre/files/pcre/8.37/pcre-8.37.tar.gz
tar -zxvf pcre-8.37.tar.gz  

./configure --enable-utf
make 

make install  

##http://blog.sina.com.cn/s/blog_5b1ae38b0101hxkz.html