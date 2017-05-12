#!/bin/sh

REMOTE=kfish

git push ${REMOTE} master
if [ -e elm.js ]; then
	git add -f elm.js
	git commit -m 'Update elm.js'
	git push --force ${REMOTE} HEAD:gh-pages
	git reset --hard HEAD^
else
	echo "Please build elm.js with:"
        echo
	echo "    elm-make ShowGamepad.elm --output elm.js"
        echo
fi
