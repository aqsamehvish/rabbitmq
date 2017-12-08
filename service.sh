#! /bin/bash
TOKEN=`cat token`
export OS_TOKEN=c8485e2e319b7453cbf8
export OS_URL=http://slave:35357/v3
export OS_IDENTITY_API_VERSION=3
openstack service list | grep -i identity
if [ $? -eq 0 ] ; then
echo " service already exist"
else
#openstack service create \
 # --name keystone --description "OpenStack Identity" identity

openstack endpoint create --region RegionOne \
  identity public http://slave:5000/v3

openstack endpoint create --region RegionOne \
  identity internal http://slave:5000/v3

openstack endpoint create --region RegionOne \
  identity admin http://slave:35357/v3
fi
