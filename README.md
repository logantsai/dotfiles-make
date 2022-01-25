## commit rule
```
Header: <type>(<scope>): <subject>

Body

Footer

Change-Id: xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
```
- Commit message 的格式 (三部分)：
  - Heaher ----- 必填
  - type ---必需
  - scope --- 可選
  - subject --- 必需
  - Body ---- 可省略
  - Footer ---- 可省略


- type: 代表 commit 的類別：feat, fix, docs, style, refactor, test, chore，必要欄位。
  - feat：新功能 (feature)
  - fix: 修補bug
  - docs：文件（documentation）
  - style：格式（不影響程式碼執行的變動）
  - refactor：重構 (既不是新增功能，也不是修改bug的程式碼變動)
  - test：增加測試
  - chore：構建過程和輔助工具的變動註釋

- scope 代表 commit 影響的範圍，例如資料庫、控制層、模板層等等，視專案不同而不同，為可選欄位。
- subject 代表此 commit 的簡短描述，不要超過 50 個字元，結尾不要加句號，為必要欄位。


## usage

- sudo apt-get install -y make git
- git clone `this repository` ~/.dotfiles
- cd ~/.dotfiles && ./genMaekfile && make

PS: sudo make will set $HOME as /root, not /home/$USER
