# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## プロジェクト概要

kickstart.nvim をベースにした個人用 Neovim 設定。日本語ローカライズとモダンな開発ツール (LSP, 補完, Git 連携) を統合。

## コマンド

```bash
# Lua ファイルのフォーマット
stylua lua/

# 設定の構文チェック (Neovim 内で実行)
:checkhealth

# プラグイン管理
:Lazy              # プラグイン状態確認
:Lazy sync         # プラグイン同期
:Lazy update       # プラグイン更新

# Mason (LSP/ツール管理)
:Mason             # インストール済みツール確認
```

## アーキテクチャ

### エントリポイント

`init.lua` がメイン設定ファイル。基本オプション、キーマップ、プラグイン定義を含む。

### プラグイン構成

```
lua/
├── custom/plugins/    # カスタムプラグイン設定 (自動インポート)
└── kickstart/plugins/ # kickstart テンプレート (未使用、参考用)
```

- **カスタムプラグイン**: `lua/custom/plugins/` 内の各 `.lua` ファイルは lazy.nvim spec を返す
- init.lua の `{ import = 'custom.plugins' }` で自動読み込み
- 新しいプラグインを追加する場合は `lua/custom/plugins/` に新規ファイルを作成

### 主要プラグイン

| カテゴリ | プラグイン |
|---------|-----------|
| パッケージ管理 | lazy.nvim |
| LSP | nvim-lspconfig, mason.nvim |
| 補完 | blink.cmp |
| ファジーファインダー | telescope.nvim, fzf-lua |
| ファイラー | neo-tree.nvim |
| Git | gitsigns.nvim, lazygit.nvim |
| フォーマッター | conform.nvim (stylua, biome, eslint_d) |

### macOS 固有

- IME 自動切り替え機能あり (`macism` コマンド使用)

## コードスタイル

- フォーマッター: stylua
- カラム幅: 160
- インデント: スペース 2 つ
- クォート: シングルクォート優先
