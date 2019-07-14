#!/bin/sh
DIR=`dirname $0`
/usr/libexec/java_home -v 1.8 --exec java -cp $DIR/javaws.jar net.sourceforge.jnlp.runtime.Boot -Xnofork -jnlp https://club.sportlink.com/apps/club-production/nevobo.jnlp
