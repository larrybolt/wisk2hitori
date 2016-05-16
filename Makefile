all:
	scilab-cli -f run.sce -nwni
github:
	scilab-cli -f run.sce -nwni -nouserstartup
test:
	scilab-cli -f tests.sce -nwni -nouserstartup

