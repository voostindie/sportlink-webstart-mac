#!/bin/sh
DIR=`dirname $0`
/usr/libexec/java_home -v 1.8 \
    --exec java -cp $DIR/javaws.jar \
    net.sourceforge.jnlp.runtime.Boot \
    -Xnofork \
    -jnlp https://club.sportlink.com/apps/club-production/nevobo.jnlp

# Iced tea's webcache doesn't really work: it caches, but never reuses,
# resulting in a 50 MB download every time. So we might as well throw it
# all away
rm -rf ~/.cache/icedtea-web/cache
