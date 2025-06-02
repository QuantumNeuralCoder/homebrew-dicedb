# 🍺 Homebrew Tap for DiceDB

This tap provides Homebrew installation for the [DiceDB](https://github.com/DiceDB) ecosystem, including the CLI and the in-memory database engine.

## 📦 Available Formulae

| Formula       | Description                       | Command                      |
|---------------|-----------------------------------|------------------------------|
| `dicedb-cli`  | DiceDB command-line interface     | `brew install dicedb-cli`    |
| `dicedb`        | DiceDB in-memory database engine  | `brew install dicedb`          |

## 🛠️ Installation

```bash
brew tap QuantumNeuralCoder/dicedb

# Install the CLI
brew install dicedb-cli

# Install the server engine (optional)
brew install dicedb
```

## 🚀 Usage

### Start DiceDB engine:

```bash
dicedb
```

Default port is `7379`. You can run this via Docker too:

```bash
docker run -p 7379:7379 dicedb/dicedb:latest
```

### Use the CLI:

```bash
dicedb-cli --help
```

## 🔄 How This Differs from the Official Script

The [official install script](https://github.com/DiceDB/dicedb-cli/blob/master/install.sh) downloads a prebuilt binary, extracts it, and manually installs it under `/usr/local/dicedb/bin`. It also creates a symlink in `/usr/local/bin`.

This Homebrew tap provides the same CLI tool in a simpler, safer, and more maintainable way:

- No need for `sudo`, `chmod`, or symlinks
- Binary is installed and managed by Homebrew
- Automatically available in your `PATH`
- Easily upgradeable with `brew upgrade`

## 📚 Resources

- DiceDB Engine: https://github.com/DiceDB/dice
- DiceDB CLI: https://github.com/DiceDB/dicedb-cli