#!/bin/bash

# lowpan interface configuration (ATUSB)


#Setting up the 6lowpan network
echo "Bringing up the network"
sudo iwpan dev wpan0 set pan_id 0xabcd
sudo iwpan phy phy0 set channel 0 11

# sudo iwpan dev wpan0 set short_addr 0x0142

sudo ip link add link wpan0 name lowpan0 type lowpan
sudo ip link set wpan0 up
sudo ip link set lowpan0 up

# ifconfig wpan0 up
# ifconfig lowpan0 up
# iwpan dev wpan0 info

# ATUSB node
# lowpan neighborgh and route configuration
SERVER_DEV=lowpan0
SERVER_IPV6=fe80::12e2:d5ff:ff00:1fa
echo "SERVER      - $SERVER_IPV6 $SERVER_DEV"

# Olimex node DEVICE_ID = 0
ID=0
CLIENT_IPV6=fe80::2be:adde:de:fa00
CLIENT_ADDR=00:be:ad:de:00:de:fa:00
echo "DEVICE_ID $ID:"
echo " CLIENT_IPV6 - $CLIENT_IPV6"
echo " CLIENT_ADDR - $CLIENT_ADDR"
sudo ip neigh add to $CLIENT_IPV6 dev lowpan0 lladdr $CLIENT_ADDR
sudo ip route add $CLIENT_IPV6 dev $SERVER_DEV
echo "route:"
ip route get $CLIENT_IPV6

# Olimex node DEVICE_ID = 1
ID=1
CLIENT_IPV6=fe80::3be:adde:de:fa00
CLIENT_ADDR=01:be:ad:de:00:de:fa:00
echo "DEVICE_ID $ID:"
echo " CLIENT_IPV6 - $CLIENT_IPV6"
echo " CLIENT_ADDR - $CLIENT_ADDR"
sudo ip neigh add to $CLIENT_IPV6 dev lowpan0 lladdr $CLIENT_ADDR
sudo ip route add $CLIENT_IPV6 dev $SERVER_DEV
echo "route:"
ip route get $CLIENT_IPV6



