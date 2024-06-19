# Nimble-Script
## Nimble Wallet erstellen

Zuvor musst du dir eine Wallet erstellen und deine Masterwallet mit den Subwallets im Discord von Nimble registrieren, wenn du das getan hast, dann kannst du den Miner installieren und ausführen.




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
