# homebrew-glpi-agent

A Homebrew tap for [GLPI Agent](https://github.com/glpi-project/glpi-agent), allowing easy installation on macOS.

## Installation

### Stable Release

To add this tap and install the stable release of the GLPI Agent, run:

```bash
brew tap eduardomozart/glpi-agent
brew trust eduardomozart/glpi-agent
brew install --cask glpi-agent
```

### Nightly Build

If you want to test the latest features and bug fixes from the `develop` branch, you can install the [nightly build](https://nightly.glpi-project.org/glpi-agent/). Note that the nightly build conflicts with the stable release, so you can only have one installed at a time.

```bash
brew tap eduardomozart/glpi-agent
brew trust eduardomozart/glpi-agent
brew install --cask glpi-agent-nightly
```

## Updates

Both casks are strictly maintained and updated automatically via a daily GitHub Action:
- The **stable** cask tracks official releases on the GitHub repository.
- The **nightly** cask tracks the latest builds published to the GLPI Project nightly server.

## Architectures

This cask supports both Intel (x86_64) and Apple Silicon (arm64) architectures and will automatically download the correct package for your system.
