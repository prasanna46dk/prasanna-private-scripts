#!/bin/bash



buildCscopeDB() {
	echo "building DB for $HOME"
	find $HOME -name *.java >   ${HOME}cscope.files
	find $HOME -name *.c >>     ${HOME}cscope.files
	find $HOME -name *.cc >>    ${HOME}cscope.files
	find $HOME -name *.h >>    ${HOME}cscope.files
	find $HOME -name *.proto >> ${HOME}cscope.files
}

buildCTags() {
	echo "using ${HOME}cscope.file for tags ${HOME}tags"
	ctags -L ${HOME}cscope.files -f ${HOME}tags
}


HOME=$1
if [ -z $HOME ]; then
	HOME="/home/prasanna/";
fi
pushd $HOME

buildCscopeDB
buildCTags

cscope -RbU -i ${HOME}cscope.files
CSCOPE_DB=${HOME}cscope.out
export CSCOPE_DB
cscope -d

popd
