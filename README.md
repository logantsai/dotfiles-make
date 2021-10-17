## folder tree



## commit rule
- Header: <type>(<scope>): <subject>
  - type: 代表 commit 的類別：feat, fix, docs, style, refactor, test, chore，必要欄位。
  - scope 代表 commit 影響的範圍，例如資料庫、控制層、模板層等等，視專案不同而不同，為可選欄位。
  - subject 代表此 commit 的簡短描述，不要超過 50 個字元，結尾不要加句號，為必要欄位。

## usage

- sudo apt-get install -y make git
- git clone `this repository` ~/.dotfiles
- cd ~/.dotfiles && ./genMaekfile && make

PS: sudo make will set $HOME as /root, not /home/$USER
