.PHONY:TAGS push

debug:
	bin/build.sh

TAGS:
#	find . -follow -name "*.as" | ctags -e -L -
	find . -follow -name "*.as" | xargs etags --language-force=actionscript
tags:TAGS

push:
	git push origin master

skin:
	cd assets/my/player/t3/ && rm ../t3.zip && zip -jXq ../t3.zip *
