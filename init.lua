--[[

=====================================================================
==================== 続ける前にこれを読んでください ====================
=====================================================================
========                                    .-----.          ========
========         .----------------------.   | === |          ========
========         |.-""""""""""""""""""-.|   |-----|          ========
========         ||                    ||   | === |          ========
========         ||   KICKSTART.NVIM   ||   |-----|          ========
========         ||                    ||   | === |          ========
========         ||                    ||   |-----|          ========
========         ||:Tutor              ||   |:::::|          ========
========         |'-..................-'|   |____o|          ========
========         `"")----------------(""`   ___________      ========
========        /::::::::::|  |::::::::::\  \ no mouse \     ========
========       /:::========|  |==hjkl==:::\  \ required \    ========
========      '""""""""""""'  '""""""""""""'  '""""""""""'   ========
========                                                     ========
=====================================================================
=====================================================================

Kickstartとは？

  Kickstart.nvimはディストリビューションでは*ありません*。

  Kickstart.nvimはあなた自身の設定を作るための出発点です。
    目標は、コードを上から下まで全て読み、設定が何をしているかを理解し、
    必要に応じて変更できるようになることです。

    それができたら、探索、設定、カスタマイズを始めて
    Neovimを自分のものにしましょう！しばらくKickstartをそのまま使い続けるもよし、
    すぐにモジュール化して分割するもよし。あなた次第です！

    Luaについて何も知らない場合は、まずガイドを読むことをお勧めします。
    10〜15分程度で読める例として：
      - https://learnxinyminutes.com/docs/lua/

    Luaをある程度理解したら、`:help lua-guide`を参考にして
    NeovimがLuaをどのように統合しているか学べます。
    - :help lua-guide
    - (HTML版): https://neovim.io/doc/user/lua-guide.html

Kickstartガイド：

  TODO: まず最初にNeovimで`:Tutor`コマンドを実行してください。

    これが何を意味するかわからない場合は、以下を入力してください：
      - <Escapeキー>
      - :
      - Tutor
      - <Enterキー>

    (Neovimの基本を既に知っている場合は、このステップをスキップできます。)

  それが完了したら、kickstartのinit.luaの残りを**読みながら**作業を続けてください。

  次に、`:help`を実行して読んでください。
    ヘルプウィンドウが開き、組み込みのヘルプドキュメントの
    読み方、ナビゲーション、検索方法についての基本情報が表示されます。

    何かで行き詰まったり困ったりしたときは、ここを最初に見るべきです。
    これは私のお気に入りのNeovim機能の一つです。

    最も重要なのは、"<space>sh"というキーマップでヘルプドキュメントを[s]検索[h]できることです。
    探しているものが正確にわからないときに非常に便利です。

  init.lua全体を通して`:help X`というコメントを残しています。
    これらはKickstartで使用されている関連設定、プラグイン、
    Neovim機能についての詳細情報を見つけるためのヒントです。

   NOTE: このような行を探してください

    ファイル全体を通してこれらがあります。読者であるあなたが何が起きているか理解するためのものです。
    理解できたら削除しても構いませんが、Neovim設定でいくつかの異なる構造に
    初めて遭遇したときのガイドとして役立つはずです。

kickstartのインストール中にエラーが発生した場合は、`:checkhealth`を実行して詳細を確認してください。

Neovimの旅を楽しんでください。
- TJ

P.S. これも終わったら削除できます。もうあなたの設定ですから！ :)
--]]

-- <space>をリーダーキーに設定
-- `:help mapleader`を参照
--  NOTE: プラグインが読み込まれる前に設定する必要があります（そうしないと間違ったリーダーキーが使われます）
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- エンコーディング設定
vim.scriptencoding = 'utf-8'
vim.opt.encoding = 'utf-8'
vim.opt.fileencoding = 'utf-8'

-- ターミナルにNerd Fontがインストールされ、選択されている場合はtrueに設定
vim.g.have_nerd_font = true

-- [[ オプション設定 ]]
-- `:help vim.o`を参照
-- NOTE: これらのオプションは自由に変更できます！
--  その他のオプションは`:help option-list`を参照

-- 行番号をデフォルトで表示
vim.o.number = true
-- 相対行番号も追加できます。ジャンプに便利です。
--  自分で試して気に入るかどうか確認してみてください！
-- vim.o.relativenumber = true

-- マウスモードを有効化。例えば分割のリサイズに便利です！
vim.o.mouse = 'a'

-- モードを表示しない（既にステータスラインに表示されているため）
vim.o.showmode = false

-- OSとNeovim間でクリップボードを同期
--  起動時間が増加する可能性があるため、`UiEnter`後にスケジュール
--  OSのクリップボードを独立させたい場合はこのオプションを削除
--  `:help 'clipboard'`を参照
vim.schedule(function()
  vim.o.clipboard = 'unnamedplus'
end)

-- breakindentを有効化
vim.o.breakindent = true

-- undo履歴を保存
vim.o.undofile = true

-- \Cまたは1つ以上の大文字が検索語に含まれていない限り、大文字小文字を区別しない検索
vim.o.ignorecase = true
vim.o.smartcase = true

-- signcolumnをデフォルトで表示
vim.o.signcolumn = 'yes'

-- 更新時間を短縮
vim.o.updatetime = 250

-- マップされたシーケンスの待機時間を短縮
vim.o.timeoutlen = 300

-- 新しい分割の開き方を設定
vim.o.splitright = true
vim.o.splitbelow = true

-- エディタで特定の空白文字をどのように表示するかを設定
--  `:help 'list'`を参照
--  および`:help 'listchars'`を参照
--
--  listcharsは`vim.o`ではなく`vim.opt`を使って設定していることに注意
--  `vim.o`と非常に似ていますが、テーブルを便利に操作するためのインターフェースを提供します
--   `:help lua-options`を参照
--   および`:help lua-options-guide`を参照
vim.o.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- 入力中にライブで置換をプレビュー！
vim.o.inccommand = 'split'

-- カーソルがある行を表示
vim.o.cursorline = true

-- カーソルの上下に保持する最小画面行数
vim.o.scrolloff = 10

-- バッファに未保存の変更がある状態で失敗する操作（`:q`など）を行う場合、
-- 代わりに現在のファイルを保存するかどうかを尋ねるダイアログを表示
-- `:help 'confirm'`を参照
vim.o.confirm = true

-- [[ 基本キーマップ ]]
--  `:help vim.keymap.set()`を参照

-- ノーマルモードで<Esc>を押したときに検索ハイライトをクリア
--  `:help hlsearch`を参照
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- 診断用キーマップ
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- 組み込みターミナルでターミナルモードを終了するためのショートカット
-- 発見しやすいようにしています。通常は<C-\><C-n>を押す必要がありますが、
-- 経験がないと推測しにくいです。
--
-- NOTE: すべてのターミナルエミュレータ/tmux等で動作するわけではありません。
-- 自分でマッピングを試すか、<C-\><C-n>を使ってターミナルモードを終了してください
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- TIP: ノーマルモードで矢印キーを無効化
-- vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
-- vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
-- vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
-- vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- 分割ナビゲーションを簡単にするキーバインド
--  CTRL+<hjkl>でウィンドウ間を移動
--
--  すべてのウィンドウコマンドの一覧は`:help wincmd`を参照
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- NOTE: 一部のターミナルはキーマップが衝突するか、異なるキーコードを送信できません
-- vim.keymap.set("n", "<C-S-h>", "<C-w>H", { desc = "Move window to the left" })
-- vim.keymap.set("n", "<C-S-l>", "<C-w>L", { desc = "Move window to the right" })
-- vim.keymap.set("n", "<C-S-j>", "<C-w>J", { desc = "Move window to the lower" })
-- vim.keymap.set("n", "<C-S-k>", "<C-w>K", { desc = "Move window to the upper" })

-- [[ 基本オートコマンド ]]
--  `:help lua-guide-autocommands`を参照

-- テキストをヤンク（コピー）したときにハイライト
--  ノーマルモードで`yap`で試してみてください
--  `:help vim.hl.on_yank()`を参照
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})

-- [[ `lazy.nvim`プラグインマネージャーのインストール ]]
--    詳細は`:help lazy.nvim.txt`またはhttps://github.com/folke/lazy.nvimを参照
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
  if vim.v.shell_error ~= 0 then
    error('Error cloning lazy.nvim:\n' .. out)
  end
end

---@type vim.Option
local rtp = vim.opt.rtp
rtp:prepend(lazypath)

-- [[ プラグインの設定とインストール ]]
--
--  プラグインの現在の状態を確認するには、以下を実行：
--    :Lazy
--
--  このメニューで`?`を押すとヘルプが表示されます。`:q`でウィンドウを閉じます
--
--  プラグインを更新するには以下を実行：
--    :Lazy update
--
-- NOTE: ここでプラグインをインストールします。
require('lazy').setup({
  -- NOTE: プラグインはリンクで追加できます（GitHubリポジトリの場合は'owner/repo'形式）。
  'NMAC427/guess-indent.nvim', -- tabstopとshiftwidthを自動検出

  -- NOTE: プラグインはテーブルを使って追加することもできます。
  -- 最初の引数はリンクで、以下のキーでプラグインの動作/読み込み等を設定できます。
  --
  -- `opts = {}`を使うと、プラグインの`setup()`関数に自動的にオプションを渡し、プラグインを強制的に読み込みます。
  --

  -- または、`config = function() ... end`を使って設定を完全に制御できます。
  -- `setup`を明示的に呼び出したい場合は以下のように記述：
  --    {
  --        'lewis6991/gitsigns.nvim',
  --        config = function()
  --            require('gitsigns').setup({
  --                -- gitsignsの設定をここに記述
  --            })
  --        end,
  --    }
  --
  -- 以下は`gitsigns.nvim`に設定オプションを渡す
  -- より高度な例です。
  --
  -- 設定キーの意味については`:help gitsigns`を参照
  { -- ガターにgit関連の記号を追加し、変更を管理するユーティリティを提供
    'lewis6991/gitsigns.nvim',
    opts = {
      signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
      },
    },
  },

  -- NOTE: プラグインは読み込み時にLuaコードを実行するように設定することもできます。
  --
  -- これは設定をグループ化したり、起動時にすぐに読み込む必要のない
  -- プラグインの遅延読み込みを処理するのに非常に便利です。
  --
  -- 例えば、以下の設定では：
  --  event = 'VimEnter'
  --
  -- を使用しており、すべてのUI要素が読み込まれる前にwhich-keyを読み込みます。
  -- イベントは通常のオートコマンドイベントです（`:help autocmd-events`）。
  --
  -- そして、`opts`キーを使用しているため（推奨）、プラグインが読み込まれた後に
  -- `require(MODULE).setup(opts)`として設定が実行されます。

  { -- 保留中のキーバインドを表示する便利なプラグイン
    'folke/which-key.nvim',
    event = 'VimEnter', -- 読み込みイベントを'VimEnter'に設定
    opts = {
      -- キーを押してからwhich-keyが開くまでの遅延（ミリ秒）
      -- この設定はvim.o.timeoutlenとは独立しています
      delay = 0,
      icons = {
        -- Nerd Fontがある場合はアイコンマッピングをtrueに設定
        mappings = vim.g.have_nerd_font,
        -- Nerd Fontを使用している場合：icons.keysを空テーブルに設定すると
        -- which-key.nvimのデフォルトNerd Fontアイコンを使用します。そうでなければ文字列テーブルを定義
        keys = vim.g.have_nerd_font and {} or {
          Up = '<Up> ',
          Down = '<Down> ',
          Left = '<Left> ',
          Right = '<Right> ',
          C = '<C-…> ',
          M = '<M-…> ',
          D = '<D-…> ',
          S = '<S-…> ',
          CR = '<CR> ',
          Esc = '<Esc> ',
          ScrollWheelDown = '<ScrollWheelDown> ',
          ScrollWheelUp = '<ScrollWheelUp> ',
          NL = '<NL> ',
          BS = '<BS> ',
          Space = '<Space> ',
          Tab = '<Tab> ',
          F1 = '<F1>',
          F2 = '<F2>',
          F3 = '<F3>',
          F4 = '<F4>',
          F5 = '<F5>',
          F6 = '<F6>',
          F7 = '<F7>',
          F8 = '<F8>',
          F9 = '<F9>',
          F10 = '<F10>',
          F11 = '<F11>',
          F12 = '<F12>',
        },
      },

      -- 既存のキーチェーンをドキュメント化
      spec = {
        { '<leader>s', group = '[S]earch' },
        { '<leader>t', group = '[T]oggle' },
        { '<leader>o', group = '[O]pen' },
        { '<leader>g', group = '[G]it' },
        { '<leader>h', group = 'Git [H]unk', mode = { 'n', 'v' } },
      },
    },
  },

  -- NOTE: プラグインは依存関係を指定できます。
  --
  -- 依存関係も適切なプラグイン仕様です。トップレベルのプラグインで
  -- できることは、依存関係でもできます。
  --
  -- 特定のプラグインの依存関係を指定するには`dependencies`キーを使用

  { -- ファジーファインダー（ファイル、LSPなど）
    'nvim-telescope/telescope.nvim',
    event = 'VimEnter',
    dependencies = {
      'nvim-lua/plenary.nvim',
      { -- エラーが発生した場合は、telescope-fzf-nativeのREADMEでインストール手順を確認
        'nvim-telescope/telescope-fzf-native.nvim',

        -- `build`はプラグインのインストール/更新時にコマンドを実行するために使用
        -- これはその時だけ実行され、Neovim起動のたびには実行されません
        build = 'make',

        -- `cond`はこのプラグインをインストールして読み込むかどうかを決定する条件
        cond = function()
          return vim.fn.executable 'make' == 1
        end,
      },
      { 'nvim-telescope/telescope-ui-select.nvim' },

      -- きれいなアイコンを表示するのに便利ですが、Nerd Fontが必要
      { 'nvim-tree/nvim-web-devicons', enabled = vim.g.have_nerd_font },
    },
    config = function()
      -- Telescopeは多くの異なるものをファジー検索できるファジーファインダーです！
      -- 単なる「ファイルファインダー」以上のもので、Neovim、ワークスペース、
      -- LSPなど、多くの異なる側面を検索できます！
      --
      -- Telescopeを使う最も簡単な方法は、以下のようにすることから始めることです：
      --  :Telescope help_tags
      --
      -- このコマンドを実行すると、ウィンドウが開き、
      -- プロンプトウィンドウに入力できます。`help_tags`オプションのリストと
      -- 対応するヘルプのプレビューが表示されます。
      --
      -- Telescope使用中の2つの重要なキーマップ：
      --  - インサートモード: <c-/>
      --  - ノーマルモード: ?
      --
      -- これにより、現在のTelescopeピッカーのすべてのキーマップを表示する
      -- ウィンドウが開きます。Telescopeで何ができるか、
      -- 実際にどうやるかを発見するのに非常に便利です！

      -- [[ Telescopeの設定 ]]
      -- `:help telescope`および`:help telescope.setup()`を参照
      require('telescope').setup {
        -- デフォルトのマッピング/更新等をここに記述できます
        --  探している情報はすべて`:help telescope.setup()`にあります
        --
        -- defaults = {
        --   mappings = {
        --     i = { ['<c-enter>'] = 'to_fuzzy_refine' },
        --   },
        -- },
        -- pickers = {}
        extensions = {
          ['ui-select'] = {
            require('telescope.themes').get_dropdown(),
          },
        },
      }

      -- Telescope拡張機能がインストールされていれば有効化
      pcall(require('telescope').load_extension, 'fzf')
      pcall(require('telescope').load_extension, 'ui-select')
    end,
  },

  -- LSPプラグイン
  {
    -- `lazydev`はNeovim設定、ランタイム、プラグイン用のLua LSPを設定
    -- Neovim APIの補完、注釈、シグネチャに使用
    'folke/lazydev.nvim',
    ft = 'lua',
    opts = {
      library = {
        -- `vim.uv`という単語が見つかったときにluvit型を読み込む
        { path = '${3rd}/luv/library', words = { 'vim%.uv' } },
      },
    },
  },
  {
    -- メインLSP設定
    'neovim/nvim-lspconfig',
    dependencies = {
      -- LSPと関連ツールをNeovimのstdpathに自動インストール
      -- Masonは依存関係の前に読み込む必要があるため、ここで設定
      -- NOTE: `opts = {}`は`require('mason').setup({})`を呼び出すのと同じ
      { 'mason-org/mason.nvim', opts = {} },
      'mason-org/mason-lspconfig.nvim',
      'WhoIsSethDaniel/mason-tool-installer.nvim',

      -- LSPの便利なステータス更新
      { 'j-hui/fidget.nvim', opts = {} },

      -- blink.cmpが提供する追加機能を有効化
      'saghen/blink.cmp',
    },
    config = function()
      -- 余談: **LSPとは？**
      --
      -- LSPは聞いたことがあるかもしれませんが、何かわからないかもしれない略語です。
      --
      -- LSPはLanguage Server Protocol（言語サーバープロトコル）の略です。
      -- エディタと言語ツールが標準化された方法で通信するのを助けるプロトコルです。
      --
      -- 一般的に、特定の言語を理解するために作られたツールである「サーバー」があります
      -- （`gopls`、`lua_ls`、`rust_analyzer`など）。これらの言語サーバー
      -- （LSPサーバーと呼ばれることもありますが、ATMマシンのような重複表現です）は
      -- 「クライアント」と通信するスタンドアロンプロセスです。この場合はNeovimです！
      --
      -- LSPはNeovimに以下のような機能を提供します：
      --  - 定義へ移動
      --  - 参照を検索
      --  - 自動補完
      --  - シンボル検索
      --  - その他！
      --
      -- したがって、言語サーバーはNeovimとは別にインストールする必要がある
      -- 外部ツールです。ここで`mason`と関連プラグインが活躍します。
      --
      -- lspとtreesitterの違いについては、素晴らしく上品に書かれた
      -- ヘルプセクション`:help lsp-vs-treesitter`をご覧ください

      --  この関数はLSPが特定のバッファにアタッチされたときに実行されます。
      --    つまり、LSPに関連付けられた新しいファイルが開かれるたびに
      --    （例えば、`main.rs`を開くと`rust_analyzer`に関連付けられます）
      --    この関数が実行されて現在のバッファを設定します
      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('kickstart-lsp-attach', { clear = true }),
        callback = function(event)
          -- NOTE: Luaは本格的なプログラミング言語であり、
          -- 小さなヘルパーやユーティリティ関数を定義して繰り返しを避けることができます。
          --
          -- ここでは、LSP関連のアイテム専用のマッピングをより簡単に定義できる
          -- 関数を作成します。毎回モード、バッファ、説明を設定します。
          local map = function(keys, func, desc, mode)
            mode = mode or 'n'
            vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
          end

          map('gd', require('fzf-lua').lsp_definitions, '[G]oto [D]efinition')
          map('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
          map('gr', require('fzf-lua').lsp_references, '[G]oto [R]eferences')
          map('gi', require('fzf-lua').lsp_implementations, '[G]oto [I]mplementation')
          map('gt', require('fzf-lua').lsp_typedefs, '[G]oto [T]ype Definition')
          map('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
          map('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction', { 'n', 'x' })

          -- この関数はneovim nightly（バージョン0.11）とstable（バージョン0.10）の違いを解決します
          ---@param client vim.lsp.Client
          ---@param method vim.lsp.protocol.Method
          ---@param bufnr? integer 一部のLSPは特定のファイルでのみメソッドをサポート
          ---@return boolean
          local function client_supports_method(client, method, bufnr)
            if vim.fn.has 'nvim-0.11' == 1 then
              return client:supports_method(method, bufnr)
            else
              return client.supports_method(method, { bufnr = bufnr })
            end
          end

          -- 以下の2つのオートコマンドは、カーソルがしばらくその場所に
          -- 留まっているときにカーソル下の単語の参照をハイライトするために使用されます
          --    実行タイミングについては`:help CursorHold`を参照
          --
          -- カーソルを移動すると、ハイライトがクリアされます（2番目のオートコマンド）
          local client = vim.lsp.get_client_by_id(event.data.client_id)
          if client and client_supports_method(client, vim.lsp.protocol.Methods.textDocument_documentHighlight, event.buf) then
            local highlight_augroup = vim.api.nvim_create_augroup('kickstart-lsp-highlight', { clear = false })
            vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
              buffer = event.buf,
              group = highlight_augroup,
              callback = vim.lsp.buf.document_highlight,
            })

            vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
              buffer = event.buf,
              group = highlight_augroup,
              callback = vim.lsp.buf.clear_references,
            })

            vim.api.nvim_create_autocmd('LspDetach', {
              group = vim.api.nvim_create_augroup('kickstart-lsp-detach', { clear = true }),
              callback = function(event2)
                vim.lsp.buf.clear_references()
                vim.api.nvim_clear_autocmds { group = 'kickstart-lsp-highlight', buffer = event2.buf }
              end,
            })
          end

          -- 以下のコードは、使用している言語サーバーがサポートしている場合に
          -- コード内のインレイヒントを切り替えるキーマップを作成します
          --
          -- コードの一部を置き換えてしまうため、望ましくない場合があります
          if client and client_supports_method(client, vim.lsp.protocol.Methods.textDocument_inlayHint, event.buf) then
            map('<leader>th', function()
              vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled { bufnr = event.buf })
            end, '[T]oggle Inlay [H]ints')
          end
        end,
      })

      -- 診断設定
      -- :help vim.diagnostic.Optsを参照
      vim.diagnostic.config {
        severity_sort = true,
        float = { border = 'rounded', source = 'if_many' },
        underline = { severity = vim.diagnostic.severity.ERROR },
        signs = vim.g.have_nerd_font and {
          text = {
            [vim.diagnostic.severity.ERROR] = '󰅚 ',
            [vim.diagnostic.severity.WARN] = '󰀪 ',
            [vim.diagnostic.severity.INFO] = '󰋽 ',
            [vim.diagnostic.severity.HINT] = '󰌶 ',
          },
        } or {},
        virtual_text = {
          source = 'if_many',
          spacing = 2,
          format = function(diagnostic)
            local diagnostic_message = {
              [vim.diagnostic.severity.ERROR] = diagnostic.message,
              [vim.diagnostic.severity.WARN] = diagnostic.message,
              [vim.diagnostic.severity.INFO] = diagnostic.message,
              [vim.diagnostic.severity.HINT] = diagnostic.message,
            }
            return diagnostic_message[diagnostic.severity]
          end,
        },
      }

      -- LSPサーバーとクライアントは、サポートする機能を互いに通信できます。
      --  デフォルトでは、NeovimはLSP仕様のすべてをサポートしているわけではありません。
      --  blink.cmp、luasnipなどを追加すると、Neovimは*より多くの*機能を持つようになります。
      --  そこで、blink.cmpで新しい機能を作成し、それをサーバーにブロードキャストします。
      local capabilities = require('blink.cmp').get_lsp_capabilities()

      -- 以下の言語サーバーを有効化
      --  ここで好きなLSPを自由に追加/削除できます。自動的にインストールされます。
      --
      --  以下のテーブルに追加のオーバーライド設定を追加できます。利用可能なキー：
      --  - cmd (table): サーバーを起動するデフォルトコマンドをオーバーライド
      --  - filetypes (table): サーバーに関連付けられたデフォルトのファイルタイプリストをオーバーライド
      --  - capabilities (table): capabilitiesのフィールドをオーバーライド。特定のLSP機能を無効にするために使用可能
      --  - settings (table): サーバー初期化時に渡されるデフォルト設定をオーバーライド
      --        例えば、`lua_ls`のオプションを見るには: https://luals.github.io/wiki/settings/
      local servers = {
        vtsls = {},
        biome = {},
        eslint = {},
        -- clangd = {},
        -- gopls = {},
        -- pyright = {},
        -- rust_analyzer = {},
        -- ... など。事前設定されたすべてのLSPのリストは`:help lspconfig-all`を参照
        --
        -- 一部の言語（typescriptなど）には便利な言語プラグインがあります:
        --    https://github.com/pmizio/typescript-tools.nvim
        --
        -- しかし、多くの設定では、LSP（`ts_ls`）で十分です
        -- ts_ls = {},
        --

        lua_ls = {
          -- cmd = { ... },
          -- filetypes = { ... },
          -- capabilities = {},
          settings = {
            Lua = {
              completion = {
                callSnippet = 'Replace',
              },
              -- 以下を切り替えてLua_LSのうるさい`missing-fields`警告を無視できます
              -- diagnostics = { disable = { 'missing-fields' } },
            },
          },
        },
      }

      -- 上記のサーバーとツールがインストールされていることを確認
      --
      -- インストールされたツールの現在の状態を確認したり、
      -- 他のツールを手動でインストールするには、以下を実行:
      --    :Mason
      --
      -- このメニューで`g?`を押すとヘルプが表示されます。
      --
      -- `mason`は先にセットアップする必要があります: オプションを設定するには
      -- 上記の`nvim-lspconfig`の`dependencies`テーブルを参照。
      --
      -- MasonにインストールさせたいNeovim内で利用可能な
      -- 他のツールをここに追加できます。
      local ensure_installed = vim.tbl_keys(servers or {})
      vim.list_extend(ensure_installed, {
        'stylua', -- Luaコードのフォーマットに使用
      })
      require('mason-tool-installer').setup { ensure_installed = ensure_installed }

      require('mason-lspconfig').setup {
        ensure_installed = {}, -- 明示的に空テーブルに設定（Kickstartはmason-tool-installer経由でインストールを行う）
        automatic_installation = false,
        handlers = {
          function(server_name)
            local server = servers[server_name] or {}
            -- これは上記のサーバー設定で明示的に渡された値のみをオーバーライドします
            -- LSPの特定の機能を無効にするときに便利（例: ts_lsのフォーマットをオフにする）
            server.capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {})
            require('lspconfig')[server_name].setup(server)
          end,
        },
      }
    end,
  },

  { -- 自動フォーマット
    'stevearc/conform.nvim',
    event = { 'BufWritePre' },
    cmd = { 'ConformInfo' },
    keys = {
      {
        '<leader>f',
        function()
          require('conform').format { async = true, lsp_format = 'fallback' }
        end,
        mode = '',
        desc = '[F]ormat buffer',
      },
    },
    opts = {
      notify_on_error = false,
      format_on_save = function(bufnr)
        -- 標準化されたコーディングスタイルがない言語では
        -- "format_on_save lsp_fallback"を無効にする。ここに他の言語を追加したり、
        -- 無効にした言語を再度有効にすることができます。
        local disable_filetypes = { c = true, cpp = true }
        if disable_filetypes[vim.bo[bufnr].filetype] then
          return nil
        else
          return {
            timeout_ms = 500,
            lsp_format = 'fallback',
          }
        end
      end,
      formatters_by_ft = {
        lua = { 'stylua' },
        -- Conformは複数のフォーマッターを順番に実行することもできます
        -- python = { "isort", "black" },
        --
        -- 'stop_after_first'を使用してリストから最初に利用可能なフォーマッターを実行できます
        -- javascript = { "prettierd", "prettier", stop_after_first = true },
      },
    },
  },

  { -- 自動補完
    'saghen/blink.cmp',
    event = 'VimEnter',
    version = '1.*',
    dependencies = {
      -- スニペットエンジン
      {
        'L3MON4D3/LuaSnip',
        version = '2.*',
        build = (function()
          -- ビルドステップはスニペットの正規表現サポートに必要です。
          -- このステップは多くのWindows環境ではサポートされていません。
          -- 以下の条件を削除してWindowsで再度有効にできます。
          if vim.fn.has 'win32' == 1 or vim.fn.executable 'make' == 0 then
            return
          end
          return 'make install_jsregexp'
        end)(),
        dependencies = {
          -- `friendly-snippets`には様々な既製のスニペットが含まれています。
          --    個別の言語/フレームワーク/プラグインのスニペットについてはREADMEを参照：
          --    https://github.com/rafamadriz/friendly-snippets
          -- {
          --   'rafamadriz/friendly-snippets',
          --   config = function()
          --     require('luasnip.loaders.from_vscode').lazy_load()
          --   end,
          -- },
        },
        opts = {},
      },
      'folke/lazydev.nvim',
    },
    --- @module 'blink.cmp'
    --- @type blink.cmp.Config
    opts = {
      keymap = {
        -- 'default'（推奨）は組み込み補完と似たマッピング
        --   <c-y>で補完を承認（[y]es）
        --    LSPがサポートしていれば自動インポートします
        --    LSPがスニペットを送信した場合はスニペットを展開します
        -- 'super-tab'はTabで承認
        -- 'enter'はEnterで承認
        -- 'none'はマッピングなし
        --
        -- 'default'プリセットが推奨される理由を理解するには
        -- `:help ins-completion`を読む必要があります
        --
        -- いや、本当に。`:help ins-completion`を読んでください、とても良いです！
        --
        -- すべてのプリセットには以下のマッピングがあります：
        -- <tab>/<s-tab>: スニペット展開の右/左に移動
        -- <c-space>: メニューを開くか、既に開いている場合はドキュメントを開く
        -- <c-n>/<c-p>または<up>/<down>: 次/前の項目を選択
        -- <c-e>: メニューを非表示
        -- <c-k>: シグネチャヘルプを切り替え
        --
        -- 独自のキーマップを定義するには:h blink-cmp-config-keymapを参照
        preset = 'default',

        -- より高度なLuasnipキーマップ（選択ノードの選択、展開など）については：
        --    https://github.com/L3MON4D3/LuaSnip?tab=readme-ov-file#keymaps
      },

      appearance = {
        -- 'mono'（デフォルト）は'Nerd Font Mono'用、'normal'は'Nerd Font'用
        -- アイコンが整列するようにスペーシングを調整
        nerd_font_variant = 'mono',
      },

      completion = {
        -- デフォルトでは`<c-space>`を押すとドキュメントが表示されます
        -- オプションで`auto_show = true`を設定すると遅延後にドキュメントを表示
        documentation = { auto_show = false, auto_show_delay_ms = 500 },
      },

      sources = {
        default = { 'lsp', 'path', 'snippets', 'lazydev' },
        providers = {
          lazydev = { module = 'lazydev.integrations.blink', score_offset = 100 },
        },
      },

      snippets = { preset = 'luasnip' },

      -- Blink.cmpにはオプションで推奨されるRustファジーマッチャーが含まれており、
      -- 有効にするとビルド済みバイナリを自動的にダウンロードします。
      --
      -- デフォルトでは代わりにLua実装を使用しますが、
      -- `'prefer_rust_with_warning'`でRust実装を有効にできます
      --
      -- 詳細は:h blink-cmp-config-fuzzyを参照
      fuzzy = { implementation = 'lua' },

      -- 関数の引数を入力中にシグネチャヘルプウィンドウを表示
      signature = { enabled = true },
    },
  },

  { -- 別のカラースキームに簡単に変更できます。
    -- 以下のカラースキームプラグインの名前を変更し、
    -- configのコマンドをそのカラースキームの名前に変更してください。
    --
    -- インストール済みのカラースキームを確認するには`:Telescope colorscheme`を使用
    'folke/tokyonight.nvim',
    priority = 1000, -- 他のすべてのスタートプラグインより先に読み込む
    config = function()
      ---@diagnostic disable-next-line: missing-fields
      require('tokyonight').setup {
        styles = {
          comments = { italic = false }, -- コメントのイタリックを無効化
        },
      }

      -- ここでカラースキームを読み込む
      -- 他の多くのテーマと同様に、このテーマには異なるスタイルがあり、
      -- 'tokyonight-storm'、'tokyonight-moon'、'tokyonight-day'などを読み込めます
      vim.cmd.colorscheme 'tokyonight-night'
    end,
  },

  -- コメント内のtodo、notesなどをハイライト
  { 'folke/todo-comments.nvim', event = 'VimEnter', dependencies = { 'nvim-lua/plenary.nvim' }, opts = { signs = false } },

  { -- 様々な小さな独立したプラグイン/モジュールのコレクション
    'echasnovski/mini.nvim',
    config = function()
      -- より良いAround/Insideテキストオブジェクト
      --
      -- 例:
      --  - va)  - [V]isually select [A]round [)]paren（括弧の周りをビジュアル選択）
      --  - yinq - [Y]ank [I]nside [N]ext [Q]uote（次のクォート内をヤンク）
      --  - ci'  - [C]hange [I]nside [']quote（クォート内を変更）
      require('mini.ai').setup { n_lines = 500 }

      -- 囲み文字（括弧、クォートなど）の追加/削除/置換
      --
      -- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren（単語を括弧で囲む）
      -- - sd'   - [S]urround [D]elete [']quotes（クォートを削除）
      -- - sr)'  - [S]urround [R]eplace [)] [']（括弧をクォートに置換）
      require('mini.surround').setup()

      -- シンプルで簡単なステータスライン
      --  気に入らなければこのセットアップ呼び出しを削除して、
      --  他のステータスラインプラグインを試すことができます
      local statusline = require 'mini.statusline'
      -- Nerd Fontがある場合はuse_iconsをtrueに設定
      statusline.setup { use_icons = vim.g.have_nerd_font }

      -- デフォルトの動作をオーバーライドしてステータスラインのセクションを設定できます
      -- 例えば、ここではカーソル位置のセクションを行:列に設定
      ---@diagnostic disable-next-line: duplicate-set-field
      statusline.section_location = function()
        return '%2l:%-2v'
      end

      -- ... そして他にもたくさんあります！
      --  チェック: https://github.com/echasnovski/mini.nvim
    end,
  },
  { -- コードのハイライト、編集、ナビゲーション
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    main = 'nvim-treesitter.config', -- optsに使用するメインモジュールを設定
    -- [[ Treesitterの設定 ]] `:help nvim-treesitter`を参照
    opts = {
      ensure_installed = { 'bash', 'c', 'diff', 'html', 'lua', 'luadoc', 'markdown', 'markdown_inline', 'query', 'vim', 'vimdoc' },
      -- インストールされていない言語を自動インストール
      auto_install = true,
      highlight = {
        enable = true,
        -- 一部の言語（Rubyなど）はインデントルールにvimの正規表現ハイライトシステムに依存しています
        --  奇妙なインデントの問題が発生している場合は、その言語を
        --  additional_vim_regex_highlightingとindentの無効化リストに追加してください
        additional_vim_regex_highlighting = { 'ruby' },
      },
      indent = { enable = true, disable = { 'ruby' } },
    },
    -- nvim-treesitterと連携するために使用できる追加のnvim-treesitterモジュールがあります
    -- いくつか探索して、興味のあるものを見つけてください:
    --
    --    - インクリメンタル選択: 含まれています、`:help nvim-treesitter-incremental-selection-mod`を参照
    --    - 現在のコンテキストを表示: https://github.com/nvim-treesitter/nvim-treesitter-context
    --    - Treesitter + textobjects: https://github.com/nvim-treesitter/nvim-treesitter-textobjects
  },

  -- 以下のコメントは、kickstartリポジトリをダウンロードした場合のみ機能します。
  -- init.luaをコピー＆ペーストしただけでは機能しません。これらのファイルが必要な場合は、
  -- リポジトリにあるので、ダウンロードして正しい場所に配置してください。

  -- NOTE: Neovimの旅の次のステップ: Kickstart用の追加プラグインを追加/設定
  --
  --  Kickstartリポジトリに含めたプラグインの例をいくつか紹介します。
  --  以下の行のいずれかのコメントを解除して有効にします（nvimの再起動が必要です）。
  --
  -- require 'kickstart.plugins.debug',
  -- require 'kickstart.plugins.indent_line',
  -- require 'kickstart.plugins.lint',
  -- require 'kickstart.plugins.autopairs',
  -- require 'kickstart.plugins.neo-tree',
  -- require 'kickstart.plugins.gitsigns', -- gitsignsの推奨キーマップを追加

  -- NOTE: 以下のimportは`lua/custom/plugins/*.lua`から独自のプラグイン、設定などを自動的に追加できます
  --    これは設定をモジュール化する最も簡単な方法です。
  --
  --  以下の行のコメントを解除し、`lua/custom/plugins/*.lua`にプラグインを追加して始めましょう。
  { import = 'custom.plugins' },
  --
  -- 読み込み、ソーシング、例に関する追加情報は`:help lazy.nvim-🔌-plugin-spec`を参照
  -- またはTelescopeを使用！
  -- ノーマルモードで`<space>sh`と入力し、`lazy.nvim-plugin`と書く
  -- 前回のTelescope検索を再開する`<space>sr`で同じウィンドウを続けることができます
}, {
  ui = {
    -- Nerd Fontを使用している場合: iconsを空テーブルに設定すると
    -- lazy.nvimのデフォルトNerd Fontアイコンを使用、そうでなければユニコードアイコンテーブルを定義
    icons = vim.g.have_nerd_font and {} or {
      cmd = '⌘',
      config = '🛠',
      event = '📅',
      ft = '📂',
      init = '⚙',
      keys = '🗝',
      plugin = '🔌',
      runtime = '💻',
      require = '🌙',
      source = '📄',
      start = '🚀',
      task = '📌',
      lazy = '💤 ',
    },
  },
})

-- 以下の行は`modeline`と呼ばれます。`:help modeline`を参照
-- vim: ts=2 sts=2 sw=2 et

-- IME自動切り替え（macOS用）
if vim.fn.has 'mac' == 1 and vim.fn.executable 'macism' == 1 then
  local ime_group = vim.api.nvim_create_augroup('IMEControl', { clear = true })

  vim.api.nvim_create_autocmd({
    'InsertLeave',
    'CmdlineLeave',
    'FocusGained',
    'VimEnter',
  }, {
    group = ime_group,
    pattern = '*',
    callback = function()
      vim.fn.jobstart({ 'macism', 'com.apple.keylayout.ABC' }, { detach = true })
    end,
  })
end

vim.keymap.set('n', '<leader>ot', function()
  if vim.bo.filetype == 'neo-tree' then
    vim.cmd 'wincmd l'
    if vim.bo.filetype == 'neo-tree' then
      vim.cmd 'vsplit'
    end
  end

  for _, buf in ipairs(vim.api.nvim_list_bufs()) do
    if vim.bo[buf].buftype == 'terminal' then
      vim.api.nvim_set_current_buf(buf)
      return
    end
  end
  vim.cmd 'terminal'
end, { desc = '[O]pen [T]erminal' })
