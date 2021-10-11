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
