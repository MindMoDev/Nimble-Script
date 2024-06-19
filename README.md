# Nimble-Script
## Nimble Wallet erstellen

Zuvor musst du dir eine Wallet erstellen und deine Masterwallet mit den Subwallets im Discord von Nimble registrieren, wenn du das getan hast, dann kannst du den Miner installieren und ausführen.
1. Installiere Go auf dem Server
```
sudo apt update
wget https://go.dev/dl/go1.22.1.linux-amd64.tar.gz
rm -rf /usr/local/go && tar -C /usr/local -xzf go1.22.1.linux-amd64.tar.gz
export PATH=$PATH:/usr/local/go/bin
```
2. Überprüfe ob Go installiert ist
```
go version
```
3. Installiere Nimble's Wallet CLI
```
sudo apt install git
mkdir $HOME/nimble && cd $HOME/nimble
git clone https://github.com/nimble-technology/wallet-public.git
cd wallet-public
make install
```
4. Erstelle eine Nimble Wallet

**Wichtig: Du brauchst mindestens 2 Wallets, eine agiert als Masterwallet und die andere als Subwallet. Für das Minen verwendest du nur die Subwallet adressen.
Welche die Subwallet ist und welche die Master, das entscheidest du im Discord. Doch zuerst erstellst du dir die Wallets, falls du keine haben solltest.
Das entfernst du "<wallet_name>" und gibst stattdessen einen Namen Bsp. ./nimble-networkd keys add SubWallet1.**

```
cd
cd go/bin
./nimble-networkd keys add <wallet_name>
```

**Die Anzeige speicherst du, denn wenn du die Daten verlieren solltest, dann verlierst du auch den Zugang zur Wallet**

5. Tritt dem Nimble Discord Server bei

Registrier nun deine Adressen.

![image](https://github.com/MindMoDev/Nimble-Script/assets/159486944/06a86040-278c-4f45-bd44-a91d152d8f0f)


## Miner installation und Ausführung

1. Führen Sie diese Befehle aus, um Git zu installieren und Ihr System zu aktualisieren
```
sudo apt update
sudo apt install git -y
```
2. Klonen Sie das GitHub-Repository auf Ihren lokalen Computer:
```
git clone https://github.com/MindMoDev/Nimble-Script.git
```
3. Navigieren Sie in das geklonte Verzeichnis:
```
cd Nimble-Script
```
4. Geben Sie dem Hauptskript Ausführungsrechte
```
chmod +x nimb.sh
```
5. Führen Sie das Skript aus und warten Sie bis es FERTIG ist
```
./nimb.sh
```
6. Navigieren Sie zu Ihrem Mining-Verzeichnis
```
cd
cd nimble
cd nimble-miner-public
```
7. Aktivieren Sie die virtuelle Umgebung für die lokale Miner-Installation
```
source ./nimenv_localminers/bin/activate
```
8. Starten Sie das Mining in einer neuen tmux-Sitzung (ersetzen Sie xxx durch Ihre Wallet-Adresse)
```
tmux new-session -d -s Nimble 'make run addr=xxx'
```
9. Zeigen Sie die laufende tmux-Sitzung an, um den Mining-Prozess zu überwachen
```
tmux attach
```
