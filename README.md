# Neovim

Forked from https://github.com/askfiy/nvim



# 安装说明

```bash
$ nvim +PlugInstall
```



# 基础配置

设计原则：涉及窗口/视图的操作均采用 `<space>` 触发



# 映射配置

## 标签功能

| 快捷键                                         | 说明           | 备注   |
| ---------------------------------------------- | -------------- | ------ |
| `<alt-n>`、`<space>bn`                         | 新建无名标签页 |        |
| `<space>bN`                                    | 新建命名标签页 | vscode |
| `<alt-h/l>`                                    | 切换标签页     |        |
| `<alt-q>`、`<alt-x>`、`<space>bc`、`<space>bx` | 关闭当前标签页 |        |
| `<alt-Q>`、`<alt-X>`、`<space>bo`、`<space>bX` | 关闭其他标签页 |        |
| `<space>bl`                                    | 关闭左侧标签页 |        |
| `<space>br`                                    | 关闭右侧标签页 |        |

### 分屏功能

| 快捷键                                | 说明                    | 备注        |
| ------------------------------------- | ----------------------- | ----------- |
| `<space>pv`、`<space>pd`、`<space>p%` | 垂直分屏 (向下)         | 参考 zellij |
| `<space>ph`、`<space>pr`              | 水平分屏 (向右)         |             |
| `<space>px`                           | 关闭当前分屏            |             |
| `<space>pX`                           | 关闭其他分屏            |             |
| `<M-(y/u/i/o)`                        | 向左/下/右/上侧扩大分屏 |             |
| `<C-h/j/k/l>`                         | 焦点切换到左/下/上/右   |             |
| `<C-m>`、`<a-m>`、`<space>pm`         | 焦点切换到编辑窗口      | main        |



## 视图功能

| 快捷键                       | 说明                | 备注     |
| ---------------------------- | ------------------- | -------- |
| `<space>e`、`<space>1`       | 打开/关闭目录视图   | explorer |
| `<space>o`、`<space>2`       | 打开/关闭大纲视图   | outline  |
| `<space>t`、`<C-\>`、`<M-\>` | 打开/关闭终端视图   | terminal |
| `<space>3`                   | 打开/关闭版本视图   | undotree |
| `<space>4`                   | 打开/关闭数据库视图 | database |

## 查找功能

| 快捷键       | 说明               | 备注       |
| ------------ | ------------------ | ---------- |
| `<leader>ff` | 在文件内搜索字符串 |            |
| `<space>FF`  | 在项目内搜索字符串 | 依赖 rg    |
| `<leader>fs` | 在文件内搜索符号   | symbol     |
| `<space>FS`  | 在项目内搜索符号   |            |
| `<leader>fm` | 在文件内搜索标记   | mark       |
| `<space>FM`  | 在项目内搜索标记   |            |
| `<leader>fb` | 在文件内搜索断点   | breakpoint |
| `<space>FB`  | 在项目内搜索断点   |            |

## 文件功能

| 快捷键               | 说明               | 备注    |
| -------------------- | ------------------ | ------- |
| `<leader>w`、`<C-s>` | 保存文件           | `:w`    |
| `<space>w`           | 保存全部文件       | `:wa`   |
| `<C-S-s>`            | 另存文件           |         |
| `<leader>q`          | 关闭文件           | `:q`    |
| `<space>q`           | 关闭全部文件       | `:qa`   |
| `<leader>Q`          | 保存并关闭文件     | `:wq`   |
| `<space>Q`           | 保存并关闭全部文件 | `:wa:q` |
| `<space><esc>`       | 不保存退出全部文件 | `:qa!`  |



## 编辑功能

| 快捷键      | 说明           | 备注 |
| ----------- | -------------- | ---- |
| `<C-l>`     | 清屏           | c    |
| `<C-a>`     | 光标跳转到行首 | c    |
| `<C-e>`     | 光标跳转到行尾 |      |
| `<C-a>`     | 全选           | n, v |
| `<C-s>`     | 保存           |      |
| `<C-z>`     | 撤销           |      |
| `<C-c>`     | 复制           |      |
| `<leader>;` | 行尾添加分号   |      |



## 代码功能