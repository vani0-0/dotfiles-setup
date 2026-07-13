# Neovim Keymaps

> Leader key: `Space`

---

## Find — `<leader>f`

| Key | Action |
|-----|--------|
| `<leader>ff` | Find files (including hidden) |
| `<leader>fg` | Live grep across project |
| `<leader>fw` | Grep word under cursor |
| `<leader>fr` | Recent files |
| `<leader>f/` | Fuzzy find in current buffer |
| `<leader>fh` | Help tags |
| `<leader>fk` | Show all keymaps |
| `<leader>fc` | Available commands |

### Inside a Telescope picker

| Key | Action |
|-----|--------|
| `<C-j>` / `<C-k>` | Move selection down / up |
| `<C-q>` | Send selected to quickfix list |
| `<C-d>` | Delete buffer (buffers picker only) |
| `<Esc>` | Close picker |

---

## Git — `<leader>g`

| Key | Action |
|-----|--------|
| `<leader>gg` | Open LazyGit |
| `<leader>gb` | Toggle current line blame |
| `<leader>gf` | Git-tracked files only |
| `<leader>gc` | Browse git commits |
| `<leader>gs` | Git status with diff preview |

---

## LSP — `<leader>l` / `g*`

> These activate once an LSP server attaches to the buffer.

| Key | Action |
|-----|--------|
| `gd` | Go to definition |
| `gD` | Go to declaration |
| `gi` | Go to implementation |
| `gt` | Go to type definition |
| `gr` | References (Telescope) |
| `K` | Hover documentation |
| `<C-k>` *(insert)* | Signature help |
| `<leader>rn` | Rename symbol |
| `<leader>ca` | Code action |
| `<leader>ls` | Document symbols (Telescope) |
| `<leader>lS` | Workspace symbols (Telescope) |
| `<leader>ld` | Workspace diagnostics (Telescope) |
| `<leader>dd` | Show diagnostic in float |
| `[d` | Previous diagnostic |
| `]d` | Next diagnostic |

---

## Buffers

| Key | Action |
|-----|--------|
| `<S-h>` | Previous buffer |
| `<S-l>` | Next buffer |
| `<leader><leader>` | Pick buffer from list (Telescope) — fast |
| `<leader>fb` | Same — alternate binding |
| `<leader>bd` | Delete (close) buffer |

---

## Windows & Splits

| Key | Action |
|-----|--------|
| `<C-h>` | Move to left split |
| `<C-j>` | Move to split below |
| `<C-k>` | Move to split above |
| `<C-l>` | Move to right split |
| `<leader>sv` | New vertical split |
| `<leader>sh` | New horizontal split |
| `<leader>sx` | Close current split |
| `<leader>se` | Equalize all split sizes |

> Opening a file in a split: from Telescope or nvim-tree, press `<C-v>` (vertical) or `<C-x>` (horizontal) instead of Enter.

---

## Explorer

| Key | Action |
|-----|--------|
| `<leader>e` | Toggle nvim-tree |
| `<leader>pv` | Open netrw |

---

## Terminal

| Key | Action |
|-----|--------|
| `<C-\>` | Toggle terminal |

---

## Completion & Snippets — inside insert mode

| Key | Action |
|-----|--------|
| `<C-Space>` | Trigger completion |
| `<Tab>` | Next item **or** expand / jump forward in snippet |
| `<S-Tab>` | Previous item **or** jump back in snippet |
| `<CR>` | Confirm selection |
| `<C-e>` | Close popup |

### Custom snippets — edit `lua/vandev/snippets.lua`

**JavaScript / TypeScript**

| Trigger | Expands to |
|---------|-----------|
| `cl` | `console.log()` |
| `cle` | `console.error()` |
| `cons` | `const name = value` |
| `let` | `let name = value` |
| `fn` | named function |
| `afn` | arrow function |
| `imp` | `import … from "…"` |
| `ife` | `if / else` block |
| `fore` | `for … of` loop |

**Dart / Flutter**

| Trigger | Expands to |
|---------|-----------|
| `stl` | `StatelessWidget` boilerplate |
| `stf` | `StatefulWidget` boilerplate |
| `pr` | `print()` |
| `sf` | `"${…}"` string interpolation |

**Dart / Riverpod**

| Trigger | Expands to |
|---------|-----------|
| `cwidget` | `ConsumerWidget` boilerplate |
| `cswidget` | `ConsumerStatefulWidget` boilerplate |
| `rprov` | `@riverpod` sync provider function |
| `rasprov` | `@riverpod` async provider function |
| `rnotif` | `@riverpod` Notifier class |
| `rasnotif` | `@riverpod` AsyncNotifier class |
| `rw` | `ref.watch(provider)` |
| `rr` | `ref.read(provider.notifier)` |
| `awhen` | `ref.watch(provider).when(data/error/loading)` |

**Dart / Freezed**

| Trigger | Expands to |
|---------|-----------|
| `frdata` | `@freezed` data class with `fromJson` |
| `frunion` | `@freezed` sealed union (initial/loading/data/error) |

**Lua**

| Trigger | Expands to |
|---------|-----------|
| `fn` | `local function` |
| `req` | `local … = require("…")` |
| `p` | `print()` |
| `map` | `vim.keymap.set(…)` |

> To add your own: open the right file in `luasnippets/` (`dart.lua`, `javascript.lua`, `lua.lua`), copy any existing `s(...)` block, change the trigger and body, save, then restart Neovim.

---

## Tips

- Press `<Space>` and wait — **which-key** will show a popup of all available next keys.
- `<leader>fk` opens Telescope keymaps — searchable list of every mapping in the session.
- `<leader>fh` opens Telescope help — search `:help` without leaving the editor.
