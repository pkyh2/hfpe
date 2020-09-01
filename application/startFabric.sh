#!/bin/bash
#
# Copyright IBM Corp All Rights Reserved
#
# SPDX-License-Identifier: Apache-2.0
#
# Exit on first error
set -e pipefail


# don't rewrite paths for Windows Git Bash users
export MSYS_NO_PATHCONV=1
starttime=$(date +%s)
CC_SRC_LANGUAGE=${1:-"go"}
CC_SRC_LANGUAGE=`echo "$CC_SRC_LANGUAGE" | tr [:upper:] [:lower:]`
CC_RUNTIME_LANGUAGE=golang
CC_SRC_PATH=github.com/chaincode/go


# clean the keystore
rm -rf ./hfc-key-store

# launch network; create channel and join peer to channel
pushd ../first-network
echo y | ./byfn.sh down
echo y | ./byfn.sh up -a -n -s couchdb -o etcdraft
popd

CONFIG_ROOT=/opt/gopath/src/github.com/hyperledger/fabric/peer
ORG1_MSPCONFIGPATH=${CONFIG_ROOT}/crypto/peerOrganizations/org1.dmc.ajou.ac.kr/users/Admin@org1.dmc.ajou.ac.kr/msp
ORG1_TLS_ROOTCERT_FILE=${CONFIG_ROOT}/crypto/peerOrganizations/org1.dmc.ajou.ac.kr/peers/peer0.org1.dmc.ajou.ac.kr/tls/ca.crt
ORG2_MSPCONFIGPATH=${CONFIG_ROOT}/crypto/peerOrganizations/org2.dmc.ajou.ac.kr/users/Admin@org2.dmc.ajou.ac.kr/msp
ORG2_TLS_ROOTCERT_FILE=${CONFIG_ROOT}/crypto/peerOrganizations/org2.dmc.ajou.ac.kr/peers/peer0.org2.dmc.ajou.ac.kr/tls/ca.crt
ORG3_MSPCONFIGPATH=${CONFIG_ROOT}/crypto/peerOrganizations/org3.dmc.ajou.ac.kr/users/Admin@org3.dmc.ajou.ac.kr/msp
ORG3_TLS_ROOTCERT_FILE=${CONFIG_ROOT}/crypto/peerOrganizations/org3.dmc.ajou.ac.kr/peers/peer0.org3.dmc.ajou.ac.kr/tls/ca.crt
ORDERER_TLS_ROOTCERT_FILE=${CONFIG_ROOT}/crypto/ordererOrganizations/dmc.ajou.ac.kr/orderers/orderer.dmc.ajou.ac.kr/msp/tlscacerts/tlsca.dmc.ajou.ac.kr-cert.pem

echo "Installing smart contract on peer0.org1.dmc.ajou.ac.kr"
docker exec \
  -e CORE_PEER_LOCALMSPID=Org1MSP \
  -e CORE_PEER_ADDRESS=peer0.org1.dmc.ajou.ac.kr:7051 \
  -e CORE_PEER_MSPCONFIGPATH=${ORG1_MSPCONFIGPATH} \
  -e CORE_PEER_TLS_ROOTCERT_FILE=${ORG1_TLS_ROOTCERT_FILE} \
  cli \
  peer chaincode install \
    -n plantsp \
    -v 1.0 \
    -p "$CC_SRC_PATH" \
    -l "$CC_RUNTIME_LANGUAGE"

echo "Installing smart contract on peer1.org1.dmc.ajou.ac.kr"
docker exec \
  -e CORE_PEER_LOCALMSPID=Org1MSP \
  -e CORE_PEER_ADDRESS=peer1.org1.dmc.ajou.ac.kr:8051 \
  -e CORE_PEER_MSPCONFIGPATH=${ORG1_MSPCONFIGPATH} \
  -e CORE_PEER_TLS_ROOTCERT_FILE=${ORG1_TLS_ROOTCERT_FILE} \
  cli \
  peer chaincode install \
    -n plantsp \
    -v 1.0 \
    -p "$CC_SRC_PATH" \
    -l "$CC_RUNTIME_LANGUAGE"

<<<<<<< HEAD
echo "Installing smart contract on peer0.org2.dmc.ajou.ac.kr"
docker exec \
  -e CORE_PEER_LOCALMSPID=Org2MSP \
  -e CORE_PEER_ADDRESS=peer0.org2.dmc.ajou.ac.kr:9051 \
  -e CORE_PEER_MSPCONFIGPATH=${ORG2_MSPCONFIGPATH} \
  -e CORE_PEER_TLS_ROOTCERT_FILE=${ORG2_TLS_ROOTCERT_FILE} \
=======
echo "Installing smart contract on peer2.org1.dmc.ajou.ac.kr"
docker exec \
  -e CORE_PEER_LOCALMSPID=Org1MSP \
  -e CORE_PEER_ADDRESS=peer2.org1.dmc.ajou.ac.kr:9051 \
  -e CORE_PEER_MSPCONFIGPATH=${ORG1_MSPCONFIGPATH} \
  -e CORE_PEER_TLS_ROOTCERT_FILE=${ORG1_TLS_ROOTCERT_FILE} \
>>>>>>> 210ac451f2a4986a7b9007d176f467367c688afb
  cli \
  peer chaincode install \
    -n plantsp \
    -v 1.0 \
    -p "$CC_SRC_PATH" \
    -l "$CC_RUNTIME_LANGUAGE"

<<<<<<< HEAD
echo "Installing smart contract on peer1.org2.dmc.ajou.ac.kr"
docker exec \
  -e CORE_PEER_LOCALMSPID=Org2MSP \
  -e CORE_PEER_ADDRESS=peer1.org2.dmc.ajou.ac.kr:10051 \
=======
echo "Installing smart contract on peer0.org2.dmc.ajou.ac.kr"
docker exec \
  -e CORE_PEER_LOCALMSPID=Org2MSP \
  -e CORE_PEER_ADDRESS=peer0.org2.dmc.ajou.ac.kr:10051 \
>>>>>>> 210ac451f2a4986a7b9007d176f467367c688afb
  -e CORE_PEER_MSPCONFIGPATH=${ORG2_MSPCONFIGPATH} \
  -e CORE_PEER_TLS_ROOTCERT_FILE=${ORG2_TLS_ROOTCERT_FILE} \
  cli \
  peer chaincode install \
    -n plantsp \
    -v 1.0 \
    -p "$CC_SRC_PATH" \
    -l "$CC_RUNTIME_LANGUAGE"

echo "Installing smart contract on peer0.org3.dmc.ajou.ac.kr"
docker exec \
  -e CORE_PEER_LOCALMSPID=Org3MSP \
  -e CORE_PEER_ADDRESS=peer0.org3.dmc.ajou.ac.kr:11051 \
  -e CORE_PEER_MSPCONFIGPATH=${ORG3_MSPCONFIGPATH} \
  -e CORE_PEER_TLS_ROOTCERT_FILE=${ORG3_TLS_ROOTCERT_FILE} \
  cli \
  peer chaincode install \
    -n plantsp \
    -v 1.0 \
    -p "$CC_SRC_PATH" \
    -l "$CC_RUNTIME_LANGUAGE"

<<<<<<< HEAD
echo "Installing smart contract on peer0.org3.dmc.ajou.ac.kr"
docker exec \
  -e CORE_PEER_LOCALMSPID=Org3MSP \
  -e CORE_PEER_ADDRESS=peer0.org3.dmc.ajou.ac.kr:11051 \
  -e CORE_PEER_MSPCONFIGPATH=${ORG3_MSPCONFIGPATH} \
  -e CORE_PEER_TLS_ROOTCERT_FILE=${ORG3_TLS_ROOTCERT_FILE} \
  cli \
  peer chaincode install \
    -n marblesp \
    -v 1.0 \
    -p "$CC_SRC_PATH" \
    -l "$CC_RUNTIME_LANGUAGE"

echo "Installing smart contract on peer1.org3.dmc.ajou.ac.kr"
docker exec \
  -e CORE_PEER_LOCALMSPID=Org3MSP \
  -e CORE_PEER_ADDRESS=peer1.org3.dmc.ajou.ac.kr:12051 \
  -e CORE_PEER_MSPCONFIGPATH=${ORG3_MSPCONFIGPATH} \
  -e CORE_PEER_TLS_ROOTCERT_FILE=${ORG3_TLS_ROOTCERT_FILE} \
  cli \
  peer chaincode install \
    -n marblesp \
    -v 1.0 \
    -p "$CC_SRC_PATH" \
    -l "$CC_RUNTIME_LANGUAGE"

=======
>>>>>>> 210ac451f2a4986a7b9007d176f467367c688afb
echo "Instantiating smart contract on dmcchannel"
docker exec \
  -e CORE_PEER_LOCALMSPID=Org1MSP \
  -e CORE_PEER_MSPCONFIGPATH=${ORG1_MSPCONFIGPATH} \
  cli \
  peer chaincode instantiate \
    -o orderer.dmc.ajou.ac.kr:7050 \
    -C dmcchannel \
<<<<<<< HEAD
    -n marblesp \
=======
    -n plantsp \
>>>>>>> 210ac451f2a4986a7b9007d176f467367c688afb
    -l "$CC_RUNTIME_LANGUAGE" \
    -v 1.0 \
    -c '{"Args":["init"]}' \
    -P "OR('Org1MSP.member','Org2MSP.member', 'Org3MSP.member')" \
    --tls \
    --collections-config /opt/gopath/src/github.com/chaincode/collections_config.json\
    --cafile ${ORDERER_TLS_ROOTCERT_FILE} \
    --peerAddresses peer0.org1.dmc.ajou.ac.kr:7051 \
    --tlsRootCertFiles ${ORG1_TLS_ROOTCERT_FILE}

echo "Waiting for instantiation request to be committed ..."
sleep 10

cat <<EOF

Total setup execution time : $(($(date +%s) - starttime)) secs ...

EOF
