# Sportlink Club Volleybal met OpenJDK op macOS

## Vereisten

- [Een computer met macOS](https://www.apple.com/nl/mac/)
- [Homebrew](https://brew.sh)

## Installatie

- Open een Terminal
- Installeer OpenJDK 8:

```sh
$> brew tap adoptopenjdk/openjdk
$> brew cask install adoptopenjdk8-openj9-jre
```

- Kloon deze repository ergens op je computer:

```sh
$> cd ~/Downloads
$> git clone https://github.com/voostindie/sportlink-webstart-mac.git
```

## Instructies

- Open een Terminal
- Start het Sportlink script:

```sh
$> ~/Downloads/sportlink-webstart-mac/sportlink.sh
```

## Achtergrond

[Sportlink Club](https://www.sportlink.nl) draait als een Java WebStart applicatie. Dit is verouderde technologie die na Java 8 niet meer wordt ondersteund. Er wordt gewerkt aan een webversie van Sportlink Club, maar die is er nog niet op moment van schrijven (14-07-2019). Wat te doen tot die tijd?

Een optie is Oracle Java 8 te installeren (of geïnstalleerd te laten). Maar dan zijn Java en WebStart in de volle breedte beschikbaar op je Mac, en dat is waarschijnlijk niet zo'n goed idee.

Een alternatief is de OpenJDK gebruiken. Nieuwe versies van OpenJDK versie 8 worden nog steeds geleverd, bijvoorbeeld via [AdoptOpenJDK](https://adoptopenjdk.net). Maar helaas werkt dat niet zomaar: de OpenJDK ondersteunt geen WebStart.

De oplossing is [IcedTea-Web](https://icedtea.classpath.org/wiki/IcedTea-Web). Dit is een OpenSource implementatie van Java WebStart, geschreven in Java. Helaas is er geen macOS versie beschikbaar. Maar die hebben we ook niet nodig: de JAR `javaws.jar` in de [binaire distributie](http://icedtea.wildebeest.org/download/icedtea-web-binaries/) is voldoende.

Het script `sportlink.sh` doet weinig anders dan Java 8 opstarten met de Java WebStart implementatie van IcedTea en een verwijzing naar de JNLP voor volleybal (`nevobo.jnlp`), te vinden op de site van Sportlink.

## Over OpenJDK

In de instructies hierboven wordt de Java Runtime Edition (JRE) geïnstalleerd met de [Eclipse OpenJ9 VM](https://www.eclipse.org/openj9/). Dit is een JRE met *low memory footprint*, *fast startup time* en *high application throughput*. 

De HotSpot VM is ook beschikbaar. Daarnaast is het ook mogelijk een Java Development Kit (JDK) te installeren.

Voor een compleet overzicht van alle JRE's en JDK's van AdoptOpenJDK:

```sh
brew search adoptopenjdk
```

Merk op dat WebStart na Java 8 niet meer wordt ondersteund.

## Over IcedTea Web

Deze repository bevat, naast deze README en een eenvoudig shell-script, het bestand `javaws.jar`, afkomstig uit versie 1.8 van de IcedTea web binaries, te vinden op <http://icedtea.wildebeest.org/download/icedtea-web-binaries/1.8/>
