#!/bin/bash

set -ex

# Compile
find -name '*.java' > build.sources.tmp
javac @build.sources.tmp
rm build.sources.tmp

# Create archive
jar cfm ./JBLS-$(git log --pretty=format:'%h' -n 1).jar ./MANIFEST.MF *
