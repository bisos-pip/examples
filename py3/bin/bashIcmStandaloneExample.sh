#!/bin/bash

IcmBriefDescription="NOTYET: Short Description Of The Module"

####+BEGIN: bx:dblock:global:file-insert :file "../lib/bash/mainRepoRootDetermine.bash"
#
# DO NOT EDIT THIS SECTION (dblock)
# ../lib/bash/mainRepoRootDetermine.bash common dblock inserted code
#
mainRepoRoot=$( cd $(dirname $0); git rev-parse --show-toplevel 2> /dev/null )
if [ -z "${mainRepoRoot}" ] ; then
    echo "E: Missing Git Base:: $0 is not in an expected git"
    exit 1
fi

####+END:

####+BEGIN: bx:dblock:global:file-insert :file "../lib/bash/seedIcmLoad.bash"
#
# DO NOT EDIT THIS SECTION (dblock)
# ../lib/bash/seedIcmLoad.bash common dblock inserted code
#
if [ "${loadFiles}" == "" ] ; then
    "${mainRepoRoot}/bin/seedIcmStandalone.bash" -l $0 "$@" 
    exit $?
fi

####+END:


function vis_describe {  cat  << _EOF_
Module description comes here.
_EOF_
		      }

# Import Libraries

#
. ${opLibBase}/pidLib.sh
# # /opt/public/osmt/lib/portLib.sh
. ${opLibBase}/portLib.sh


function G_postParamHook {
     return 0
}

function vis_examples {
    typeset extraInfo="-h -v -n showRun"
    #typeset extraInfo=""
    typeset runInfo="-p ri=lsipusr:passive"

    typeset examplesInfo="${extraInfo} ${runInfo}"

    visLibExamplesOutput ${G_myName} 
  cat  << _EOF_
$( examplesSeperatorTopLabel "${G_myName}" )
$( examplesSeperatorChapter "Chapter Title" )
$( examplesSeperatorSection "Section Title" )
${G_myName} ${extraInfo} -i someAction # Does Some Work
${G_myName} ${extraInfo} -p someParam=someValue -i someAction arg1 arg2 "And The Third One"
_EOF_
}

noArgsHook() {
  vis_examples
}

function vis_someAction {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
echo someParam and args 
_EOF_
    }
    EH_assert [[ $# -ge 0 ]]

    lpDo echo "Param: someParam=${someParam}"

    local each
    for each in "$@" ; do
	lpDo echo "Args List: ${each}"
    done

    lpReturn
}

