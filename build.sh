#!/bin/bash

set -ex

# Compile
find -name '*.java' > build.sources.tmp
javac @build.sources.tmp
rm build.sources.tmp

# Alternative compile: not sure how different this is from the "official" way,
# but it seems cleaner and seems to produce the same output.
#find -name '*.java' -print0 | xargs -0 javac

# Create archive
jar cfm ./JBLS-$(git log --pretty=format:'%h' -n 1).jar ./MANIFEST.MF *
