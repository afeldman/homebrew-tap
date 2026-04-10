# afeldman Homebrew Tap

Dieses Repository ist der Homebrew Tap fuer eigene CLI-Tools.

**Hinweis:** Enthaelt sowohl Formulae (unter `Formula/`) als auch Casks (unter `Casks/`).

## Enthaltene Pakete

### Formulae (Bash/Shell Tools)
- `scripts` — personal utility scripts (encryption, certs, git, dev tools)
- `devops-desk` — terminal-based DevOps control center

### Casks
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

**Formulae (ohne --cask):**

```bash
brew install afeldman/tap/scripts
brew install afeldman/tap/devops-desk
```

**Casks (mit --cask):**

```bash
brew install --cask afeldman/tap/cloudlogin
brew install --cask afeldman/tap/project-check
brew install --cask afeldman/tap/batch-cost
brew install --cask afeldman/tap/shred
brew install --cask afeldman/tap/gofish
brew install --cask afeldman/tap/goshellcheck
```

### 3) Upgrades

```bash
brew update
brew upgrade afeldman/tap/scripts
brew upgrade afeldman/tap/devops-desk
brew upgrade --cask afeldman/tap/cloudlogin
```

### 4) Deinstallation

```bash
brew uninstall afeldman/tap/scripts
brew uninstall afeldman/tap/devops-desk
brew uninstall --cask afeldman/tap/cloudlogin
```

## Troubleshooting

### Tap wird nicht gefunden

```bash
brew untap afeldman/tap
brew tap afeldman/tap
```

### Version pruefen

```bash
brew info afeldman/tap/devops-desk
devops-desk --help
```

## Hinweis fuer Releases

- **Formulae:** Werden aus GitHub Tags geladen (z.B. `v0.1.0`). SHA256 muss in der .rb-Datei aktualisiert werden.
- **Casks:** Werden automatisiert erzeugt (GoReleaser) und sollten nicht manuell editiert werden.
