# ssh-pub-keys

## Setup

- 以下のコマンドを実行して crontab を一度開いておく.
- crontab を一度も開いていないと追記できない.

```sh
crontab -e
```

- ssh key を取得するコードを crontab に追加

```sh
curl --proto '=https' -sSf 'https://pollenjp.github.io/ssh-pub-keys/setup.sh' \
  | bash
```

check by the next command

```sh
crontab -e
```

## Developers

You shouldn't change the filename `docs/fetch-and-run.sh`.
If you change the name, need to update crontab and `~/.ssh/fetch-and-run.sh` name.
