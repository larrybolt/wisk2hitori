all:
	scilab-cli -f test.sce -nwni
github:
	scilab-cli -f run.sce -nwni -nouserstartup
test:
	scilab-cli -f test.sce -nwni -nouserstartup

