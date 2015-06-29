


yum -y install make gcc-c++ cmake bison-devel  ncurses-devel

wget http://www.cmake.org/files/v2.8/cmake-2.8.10.2.tar.gz   
tar -xzf cmake-2.8.10.2.tar.gz   
cd cmake-2.8.10.2   
./bootstrap ; make ; make install   
cd ~


groupadd mysql  

useradd -r -g mysql mysql 