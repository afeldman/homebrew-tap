# afeldman Homebrew Tap

Dieses Repository ist der Homebrew Tap fuer eigene CLI-Tools.

Wichtig: Aktuell werden hier Casks veroeffentlicht (unter `Casks/`), keine Formulae (unter `Formula/`).

## Enthaltene Pakete

- batch-cost
- cloudlogin
- gofish
- goshellcheck
- project-check
- shred

## Nutzung mit Homebrew

### 1) Tap hinzufuegen

```bash
brew tap afeldman/tap
```

### 2) Tool installieren

Explizit ueber den Tap:

```bash
brew install --cask afeldman/tap/cloudlogin
```

Weitere Beispiele:

```bash
brew install --cask afeldman/tap/project-check
brew install --cask afeldman/tap/batch-cost
brew install --cask afeldman/tap/shred
brew install --cask afeldman/tap/gofish
brew install --cask afeldman/tap/goshellcheck
```

### 3) Upgrades

```bash
brew update
brew upgrade --cask afeldman/tap/cloudlogin
```

### 4) Deinstallation

```bash
brew uninstall --cask afeldman/tap/cloudlogin
```

## Nutzung mit Zerobrew

Zerobrew ist Homebrew-kompatibel fuer schnelle Formula-Installationen, aber dieser Tap liefert derzeit Casks.

Das bedeutet:

- Tools aus diesem Tap bitte mit Homebrew installieren (`brew install --cask ...`).
- Zerobrew kannst du parallel fuer normale Formulae nutzen.

Beispiel gemischter Workflow:

```bash
# Casks aus diesem Tap
brew tap afeldman/tap
brew install --cask afeldman/tap/cloudlogin

# Schnelle Formula-Installation mit Zerobrew
zb install ripgrep fd bat
```

Updates im Mix:

```bash
# Homebrew Casks (dieser Tap)
brew update
brew upgrade --cask

# Zerobrew Formulae
zb update
zb install <formula>
```

## Troubleshooting

### Tap wird nicht gefunden

```bash
brew untap afeldman/tap
brew tap afeldman/tap
```

### Version pruefen

```bash
brew info --cask afeldman/tap/cloudlogin
cloudlogin --version
```

## Hinweis fuer Releases

Die Cask-Dateien werden automatisiert erzeugt (GoReleaser) und sollten nicht manuell editiert werden.
