#!/bin/bash
#########################################
#Function:    update source
#Usage:       bash update_source.sh
#Author:      Customer service department
#########################################

check_os_release()
{
  while true
  do
    os_release=$(grep "Red Hat Enterprise Linux Server release" /etc/issue 2>/dev/null)
    os_release_2=$(grep "Red Hat Enterprise Linux Server release" /etc/redhat-release 2>/dev/null)
    if [ "$os_release" ] && [ "$os_release_2" ]
    then
      if echo "$os_release"|grep "release 5" >/dev/null 2>&1
      then
        os_release=redhat5
        echo "$os_release"
      elif echo "$os_release"|grep "release 6" >/dev/null 2>&1
      then
        os_release=redhat6
        echo "$os_release"
      else
        os_release=""
        echo "$os_release"
      fi
      break
    fi
    os_release=$(grep "Aliyun Linux release" /etc/issue 2>/dev/null)
    os_release_2=$(grep "Aliyun Linux release" /etc/aliyun-release 2>/dev/null)
    if [ "$os_release" ] && [ "$os_release_2" ]
    then
      if echo "$os_release"|grep "release 5" >/dev/null 2>&1
      then
        os_release=aliyun5
        echo "$os_release"
      elif echo "$os_release"|grep "release 6" >/dev/null 2>&1
      then
        os_release=aliyun6
        echo "$os_release"
      elif echo "$os_release"|grep "release 7" >/dev/null 2>&1
      then
        os_release=aliyun7
        echo "$os_release"
      else
        os_release=""
        echo "$os_release"
      fi
      break
    fi
    os_release_2=$(grep "CentOS" /etc/*release 2>/dev/null)
    if [ "$os_release_2" ]
    then
      if echo "$os_release_2"|grep "release 5" >/dev/null 2>&1
      then
        os_release=centos5
        echo "$os_release"
      elif echo "$os_release_2"|grep "release 6" >/dev/null 2>&1
      then
        os_release=centos6
        echo "$os_release"
      elif echo "$os_release_2"|grep "release 7" >/dev/null 2>&1
      then
        os_release=centos7
        echo "$os_release"
      else
        os_release=""
        echo "$os_release"
      fi
      break
    fi
    os_release=$(grep -i "ubuntu" /etc/issue 2>/dev/null)
    os_release_2=$(grep -i "ubuntu" /etc/lsb-release 2>/dev/null)
    if [ "$os_release" ] && [ "$os_release_2" ]
    then
      if echo "$os_release"|grep "Ubuntu 10" >/dev/null 2>&1
      then
        os_release=ubuntu10
        echo "$os_release"
      elif echo "$os_release"|grep "Ubuntu 12.04" >/dev/null 2>&1
      then
        os_release=ubuntu1204
        echo "$os_release"
      elif echo "$os_release"|grep "Ubuntu 12.10" >/dev/null 2>&1
      then
        os_release=ubuntu1210
        echo "$os_release"
     elif echo "$os_release"|grep "Ubuntu 14.04" >/dev/null 2>&1
     then
        os_release=ubuntu1204
        echo "$os_release" 
      else
        os_release=""
        echo "$os_release"
      fi
      break
    fi
    os_release=$(grep -i "debian" /etc/issue 2>/dev/null)
    os_release_2=$(grep -i "debian" /proc/version 2>/dev/null)
    if [ "$os_release" ] && [ "$os_release_2" ]
    then
      if echo "$os_release"|grep "Linux 6" >/dev/null 2>&1
      then
        os_release=debian6
        echo "$os_release"
      elif echo "$os_release"|grep "Linux 7" >/dev/null 2>&1
      then
        os_release=debian7
        echo "$os_release"
      else
        os_release=""
        echo "$os_release"
      fi
      break
    fi
    os_release=$(grep -i "opensuse" /etc/issue 2>/dev/null)
    os_release_2=$(grep -i "opensuse" /etc/*release 2>/dev/null)
    if [ "$os_release" ] && [ "$os_release_2" ]
    then
      if echo "$os_release"|grep "openSUSE 13.1" >/dev/null 2>&1
      then
        os_release=opensuse1301
        echo "$os_release"
      else
        os_release=""
        echo "$os_release"
      fi
      break
    fi
    break
    done
}

modify_aliyun5_yum()
{
  #wget -O /etc/yum.repos.d/CentOS-Base.repo http://mirrors.aliyun.com/repo/Centos-5.repo
  #sed -i 's/\$releasever/5/' /etc/yum.repos.d/CentOS-Base.repo
  #wget -qO /etc/yum.repos.d/epel.repo http://mirrors.aliyun.com/repo/epel-5.repo
  yum clean metadata
  yum makecache
  cd ~
}

modify_rhel5_yum()
{
  #wget -O /etc/yum.repos.d/CentOS-Base.repo http://mirrors.aliyun.com/repo/Centos-5.repo
  #wget -qO /etc/yum.repos.d/epel.repo http://mirrors.aliyun.com/repo/epel-5.repo
  yum clean metadata
  yum makecache
  cd ~
}

modify_rhel6_yum()
{
  #wget -O /etc/yum.repos.d/CentOS-Base.repo http://mirrors.aliyun.com/repo/Centos-6.repo
  #wget -qO /etc/yum.repos.d/epel.repo http://mirrors.aliyun.com/repo/epel-6.repo
  yum clean metadata
  yum makecache
  cd ~
}

modify_rhel7_yum()
{
  #wget -O /etc/yum.repos.d/CentOS-Base.repo http://mirrors.aliyun.com/repo/Centos-7.repo
  #wget -qO /etc/yum.repos.d/epel.repo http://mirrors.aliyun.com/repo/epel-7.repo
  yum clean metadata
  yum makecache
  cd ~
}

update_ubuntu10_apt_source()
{
echo -e "\033[40;32mBackup the original configuration file,new name and path is /etc/apt/sources.list.back.\n\033[40;37m"
cp -fp /etc/apt/sources.list /etc/apt/sources.list.back
#cat > /etc/apt/sources.list <<EOF
#ubuntu
#deb http://cn.archive.ubuntu.com/ubuntu/ maverick main restricted universe multiverse
#deb-src http://cn.archive.ubuntu.com/ubuntu/ maverick main restricted universe multiverse
#163
#deb http://mirrors.163.com/ubuntu/ maverick main universe restricted multiverse
#deb-src http://mirrors.163.com/ubuntu/ maverick main universe restricted multiverse
#deb http://mirrors.163.com/ubuntu/ maverick-updates universe main multiverse restricted
#deb-src http://mirrors.163.com/ubuntu/ maverick-updates universe main multiverse restricted
#lupaworld
#deb http://mirror.lupaworld.com/ubuntu/ maverick main universe restricted multiverse
#deb-src http://mirror.lupaworld.com/ubuntu/ maverick main universe restricted multiverse
#deb http://mirror.lupaworld.com/ubuntu/ maverick-security universe main multiverse restricted
#deb-src http://mirror.lupaworld.com/ubuntu/ maverick-security universe main multiverse restricted
#deb http://mirror.lupaworld.com/ubuntu/ maverick-updates universe main multiverse restricted
#deb http://mirror.lupaworld.com/ubuntu/ maverick-proposed universe main multiverse restricted
#deb-src http://mirror.lupaworld.com/ubuntu/ maverick-proposed universe main multiverse restricted
#deb http://mirror.lupaworld.com/ubuntu/ maverick-backports universe main multiverse restricted
#deb-src http://mirror.lupaworld.com/ubuntu/ maverick-backports universe main multiverse restricted
#deb-src http://mirror.lupaworld.com/ubuntu/ maverick-updates universe main multiverse restricted
#EOF
apt-get update
}

update_ubuntu1204_apt_source()
{
echo -e "\033[40;32mBackup the original configuration file,new name and path is /etc/apt/sources.list.back.\n\033[40;37m"
cp -fp /etc/apt/sources.list /etc/apt/sources.list.back
apt-get update
}

update_ubuntu1210_apt_source()
{
echo -e "\033[40;32mBackup the original configuration file,new name and path is /etc/apt/sources.list.back.\n\033[40;37m"
cp -fp /etc/apt/sources.list /etc/apt/sources.list.back
apt-get update
}

update_ubuntu1404_apt_source()
{
echo -e "\033[40;32mBackup the original configuration file,new name and path is /etc/apt/sources.list.back.\n\033[40;37m"
cp -fp /etc/apt/sources.list /etc/apt/sources.list.back
apt-get update
}

update_debian6_apt_source()
{
echo -e "\033[40;32mBackup the original configuration file,new name and path is /etc/apt/sources.list.back.\n\033[40;37m"
cp -fp /etc/apt/sources.list /etc/apt/sources.list.back
apt-get update
}

update_debian7_apt_source()
{
echo -e "\033[40;32mBackup the original configuration file,new name and path is /etc/apt/sources.list.back.\n\033[40;37m"
cp -fp /etc/apt/sources.list /etc/apt/sources.list.back
apt-get update
}

update_opensuse_source()
{
}

####################Start###################
#check lock file ,one time only let the script run one time 
LOCKfile=/tmp/.$(basename $0)
if [ -f "$LOCKfile" ]
then
  echo -e "\033[1;40;31mThe script is already exist,please next time to run this script.\n\033[0m"
  exit
else
  echo -e "\033[40;32mStep 1.No lock file,begin to create lock file and continue.\n\033[40;37m"
  touch $LOCKfile
fi

#check user
if [ $(id -u) != "0" ]
then
  echo -e "\033[1;40;31mError: You must be root to run this script, please use root to install this script.\n\033[0m"
  rm -rf $LOCKfile
  exit 1
fi
echo -e "\033[40;32mStep 2.Begin to check the OS issue.\n\033[40;37m"
os_release=$(check_os_release)
if [ "X$os_release" == "X" ]
then
  echo -e "\033[1;40;31mThe OS does not identify,So this script is not executede.\n\033[0m"
  rm -rf $LOCKfile
  exit 0
else
  echo -e "\033[40;32mThis OS is $os_release.\n\033[40;37m"
fi

echo -e "\033[40;32mStep 3.Begin to modify the source configration file and update.\n\033[40;37m"
case "$os_release" in
aliyun5)
  modify_aliyun5_yum
  ;;
redhat5|centos5)
  modify_rhel5_yum
  ;;
redhat6|centos6|aliyun6)
  modify_rhel6_yum
  ;;
centos7|aliyun7)
  modify_rhel7_yum
  ;;
ubuntu10)
  update_ubuntu10_apt_source
  ;;
ubuntu1204)
  update_ubuntu1204_apt_source
  ;;
ubuntu1210)
  update_ubuntu1210_apt_source
  ;;
ubuntu1404)
  update_ubuntu1404_apt_source
  ;;
debian6)
  update_debian6_apt_source
  ;;
debian7)
  update_debian7_apt_source
  ;;
opensuse1301)
  update_opensuse_source
  ;;
esac
echo -e "\033[40;32mSuccess,exit now!\n\033[40;37m"
rm -rf $LOCKfile
