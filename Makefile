all:
	scilab-cli -f test.sce -nwni
github:
	scilab-cli -f test.sce -nwni -nouserstartup
test:
	scilab-cli -f tests.sce -nwni -nouserstartup
testone:
	scilab-cli -f testone.sce

