xxd -c 4 -g 4 -ps main.bin | sed -E 's/(..)(..)(..)(..)/ x"\1", x"\2", x"\3", x"\4",/'
