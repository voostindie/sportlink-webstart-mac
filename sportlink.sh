#!/bin/sh
DIR=`dirname $0`
source "$HOME/.sdkman/bin/sdkman-init.sh"
sdk use java `sdk ls java | grep "8.*.j9-adpt" | cut -f 6 -d "|"`
java -cp $DIR/javaws.jar \
    net.sourceforge.jnlp.runtime.Boot \
    -Xnofork \
    -jnlp https://club.sportlink.com/apps/club-production/nevobo.jnlp

# De cache van IcedTea werkt niet goed. Bij opnieuw gebruik wordt alles
# gewoon opnieuw gedownload, en komt er een extra cache van ongeveer
# 50 MB bij. Idealiter zorg ik dat dat wel werkt, maar zolang dat niet
# het geval is kunnen we cache beter helemaal opruimen:
rm -rf ~/.cache/icedtea-web/cache
