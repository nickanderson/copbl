all: CfengineStdLibrary.html build_library

# test

CfengineStdLibrary.html: stdlib.texinfo
	echo You need to run ESC x texinfo-every-node-update, texinfo_all_menus_update
	xemacs stdlib.texinfo
	makeinfo --force --html --no-split --css-include=cfcomdoc.css stdlib.texinfo
	echo "Now copy this scp TO cf001lin.cfengine.com:/cfengine/cf001lin/community/app/webroot/manuals/"

stdlib.texinfo: cfengine_stdlib.cf
	./build_library

build_library: build_library.c
	gcc -o build_library build_library.c

