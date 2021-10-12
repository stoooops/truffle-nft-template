
CONTRACT_NAME=MyNFT

all: compile

setup:
	npm init -y
	type truffle >/dev/null 2>&1 || sudo npm install -g truffle
	type ganache-cli >/dev/null 2>&1 || sudo npm install -g ganache-cli
	truffle init

install:
	npm install

compile:
	truffle compile

migrate_goerli:
	truffle migrate --network goerli

migrate_rinkeby:
	truffle migrate --network rinkeby

migrate_rinkeby_force:
	truffle migrate --network rinkeby --reset
	sleep 15
	truffle run verify $(CONTRACT_NAME) --network rinkeby

