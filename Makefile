all:

setup:
	npm init -y
	type truffle >/dev/null 2>&1 || sudo npm install -g truffle
	truffle init

