# Sportlink Club Volleybal met OpenJDK 8 op macOS

## Introductie

[Sportlink Club](https://www.sportlink.nl) draait als een Java WebStart applicatie. Dit is verouderde technologie die na Java 8 niet meer wordt ondersteund. Er wordt gewerkt aan een webversie van Sportlink Club, maar die is er nog niet op moment van schrijven (14-07-2019). Wat te doen tot die tijd?

Een optie is Oracle Java 8 te installeren (of geïnstalleerd te laten). Maar dan zijn Java en WebStart in de volle breedte beschikbaar op je Mac, en dat is waarschijnlijk niet zo'n goed idee.

Een alternatief is de OpenJDK gebruiken. Nieuwe versies van OpenJDK versie 8 worden nog steeds geleverd, bijvoorbeeld via [AdoptOpenJDK](https://adoptopenjdk.net). Maar helaas werkt dat niet zomaar: de OpenJDK ondersteunt geen WebStart.

Vandaar deze tool. 

## STOP!

Zeer waarschijnlijk heb je deze tool niet nodig. Sinds de creatie ervan is namelijk [OpenWebStart](https://openwebstart.com) verschenen, wat een implementatie van WebStart op actuele versies van Java moet zijn.

Omdat ik zelf Java voor meerdere doeleinden gebruik is OpenWebStart voor mij zelf niet zo heel nuttig, maar voor de gemiddelde gebruiker is het waarschijnlijk precies wat nodig is.

Mijn advies is daarom: probeer eerst OpenWebStart. Mocht dat niet werken, of bevalt het je niet, gebruik dan deze tool.

## Vereisten

- [Een computer met macOS](https://www.apple.com/nl/mac/)

## Installatie

- Open een Terminal
- Installeer SDKMAN!:

```sh
curl -s "https://get.sdkman.io" | bash
source ~/.sdkman/bin/sdkman-init.sh
```

- Installeer OpenJDK 8:

```sh
sdk install java `sdk ls java | grep "8.*.j9-adpt" | cut -f 6 -d "|"`
```

- Kloon deze repository ergens op je computer:

```sh
cd ~/Downloads
git clone https://github.com/voostindie/sportlink-webstart-mac.git
```

## Instructies voor gebruik

- Open een Terminal
- Start het Sportlink script:

```sh
~/Downloads/sportlink-webstart-mac/sportlink.sh
```

## Achtergrond

[Sportlink Club](https://www.sportlink.nl) draait als een Java WebStart applicatie. Dit is verouderde technologie die na Java 8 niet meer wordt ondersteund. Er wordt gewerkt aan een webversie van Sportlink Club, maar die is er nog niet op moment van schrijven (14-07-2019). Wat te doen tot die tijd?

Een optie is Oracle Java 8 te installeren (of geïnstalleerd te laten). Maar dan zijn Java en WebStart in de volle breedte beschikbaar op je Mac, en dat is waarschijnlijk niet zo'n goed idee.

Een alternatief is de OpenJDK gebruiken. Nieuwe versies van OpenJDK versie 8 worden nog steeds geleverd, bijvoorbeeld via [AdoptOpenJDK](https://adoptopenjdk.net). Maar helaas werkt dat niet zomaar: de OpenJDK ondersteunt geen WebStart.

De oplossing is [IcedTea-Web](https://icedtea.classpath.org/wiki/IcedTea-Web). Dit is een OpenSource implementatie van Java WebStart, geschreven in Java. Helaas is er geen macOS versie beschikbaar. Maar die hebben we ook niet nodig: de JAR `javaws.jar` in de [binaire distributie](http://icedtea.wildebeest.org/download/icedtea-web-binaries/) is voldoende.

Het script `sportlink.sh` doet weinig anders dan Java 8 opstarten met de Java WebStart implementatie van IcedTea en een verwijzing naar de JNLP voor volleybal (`nevobo.jnlp`), te vinden op de site van Sportlink.

## Over OpenJDK

In de instructies hierboven wordt een Java Development Kit (JDK) geïnstalleerd op basis van de [Eclipse OpenJ9 VM](https://www.eclipse.org/openj9/). Dit is een virtuele machine met *low memory footprint*, *fast startup time* en *high application throughput*. 

Na Java 8 wordt WebStart meer ondersteund.

## Over SDKMAN!

[SDKMAN!](https://sdkman.io) is een tool speciaal gemaakt voor het beheren van JDK's en SDK's voor Java op Unix-systemen. Door Java te installeren met SDKMAN! wordt deze netjes geïsoleerd op je computer en niet centraal beschikbaar gesteld.

Het installatie om Java 8 te installeren ziet er misschien wat ingewikkeld uit. Dit is enkel gedaan om geen heel specifieke versie van Java 8 te gebruiken. Op dit moment (25-04-2020) is `8.0.252.j9-adpt` de actuele versie, maar dat kan zomaar veranderen.

## Over IcedTea Web

Deze repository bevat, naast deze README en een eenvoudig shell-script, het bestand `javaws.jar`, afkomstig uit versie 1.8 van de IcedTea web binaries, te vinden op <http://icedtea.wildebeest.org/download/icedtea-web-binaries/1.8/>
