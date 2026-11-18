# keelos-dev Homebrew tap

```sh
brew install --cask keelos-dev/tap/hypermac
```

[hyperMAC](https://github.com/keelos-dev/hyperMAC) updates itself after that ("Check for Updates…"),
so `brew upgrade` skips it unless you pass `--greedy`. `brew uninstall --cask hypermac` stops the
service and removes the login item; `--zap` also deletes `~/Library/Application Support/hyperMAC`
(virtual machines included).
