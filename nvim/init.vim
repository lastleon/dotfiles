let mapleader=' '

" General Settings
set nocompatible
set ttyfast
set clipboard+=unnamedplus
set hidden
set mouse=a
set shiftwidth=4
set tabstop=4
set softtabstop=4

" UI
set scrolloff=10
set number
set title
set completeopt=menu,menuone
set wildmenu
set wildmode=longest,list
set signcolumn=yes
set conceallevel=0
set pumheight=10
set breakindent  " when softwrapping, indents the wrapped text the same as the original line
set cursorline  " highlights current line

" Search
" set showmatch "doesnt seem to do anything
set ignorecase
set smartcase
set nohlsearch

filetype plugin indent on
syntax on

" Plugins
call plug#begin("~/.vim/plugged")
" Theme
Plug 'dasupradyumna/midnight.nvim'
Plug 'rktjmp/lush.nvim'
Plug 'kartikp10/noctis.nvim'
Plug 'Mofiqul/vscode.nvim'
Plug 'sainnhe/sonokai'
Plug 'marko-cerovac/material.nvim'
Plug 'ellisonleao/gruvbox.nvim'
" Plug 'tanvirtin/monokai.nvim'
Plug 'loctvl842/monokai-pro.nvim'
Plug 'folke/tokyonight.nvim'
Plug 'rose-pine/neovim'
Plug 'catppuccin/nvim'

" Utils
"" Syntax Highlighting
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/nvim-treesitter-textobjects'


"" LSP & Autocompletion
Plug 'Tummetott/reticle.nvim/'
Plug 'neovim/nvim-lspconfig' " Collection of LSP configurations
Plug 'hrsh7th/nvim-cmp' " Main autocompletion plugin
Plug 'hrsh7th/cmp-nvim-lsp' " V Plugins for nvim-cmp 
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'L3MON4D3/LuaSnip' " Lua Snippets
Plug 'rafamadriz/friendly-snippets'
Plug 'windwp/nvim-autopairs' " Add brackets after functions
Plug 'onsails/lspkind.nvim' " Shows pictograms for autocomplete suggestions
Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'

" Plug 'nvimdev/lspsaga.nvim'
Plug 'VonHeikemen/lsp-zero.nvim', { 'branch': 'v3.x' }


" Plug 'ray-x/guihua.lua', {'do': 'cd lua/fzy && make' }
" Plug 'ray-x/navigator.lua'

"" Navigation
Plug 'nvim-lua/plenary.nvim' " telescope dependency
Plug 'nvim-telescope/telescope.nvim', { 'branch': '0.1.x' }
Plug 'nvim-telescope/telescope-frecency.nvim'
Plug 'nvim-neo-tree/neo-tree.nvim'
Plug 'MunifTanjim/nui.nvim'
" Plug 'stevearc/oil.nvim'
" Plug 'ggandor/leap.nvim'


"" QoL
Plug 'kosayoda/nvim-lightbulb'
Plug 'RRethy/vim-illuminate' " Underlines / highlights all other occurences of var
Plug 'nvim-lualine/lualine.nvim'
Plug 'arkav/lualine-lsp-progress'
Plug 'folke/todo-comments.nvim' " Highlights TODOs etc
Plug 'ThePrimeagen/harpoon', { 'branch': 'harpoon2' } " Unsure whether to keep it or not
Plug 'SmiteshP/nvim-navic'
Plug 'nvim-tree/nvim-web-devicons'
Plug 'utilyre/barbecue.nvim'
Plug 'AckslD/nvim-neoclip.lua'
Plug 'NMAC427/guess-indent.nvim'
Plug 'numToStr/Comment.nvim'
Plug 'folke/trouble.nvim'
Plug 'aznhe21/actions-preview.nvim'
Plug 'rachartier/tiny-code-action.nvim'
Plug 'kevinhwang91/nvim-bqf'
" Plug 'kylechui/nvim-surround'
Plug 'echasnovski/mini.surround'
Plug 'folke/zen-mode.nvim'


"" Tmux integration
Plug 'aserowy/tmux.nvim'



" Lanuguage Support
Plug 'kaarmu/typst.vim'

"""""""" TODO:
" great if combination of treestyle and oil
" stevearc/oil.nvim 
"
" Navigation
" ggandor/leap.nvim
"
" Utility
" nvim-treesitter/nvim-treesitter-textobjects
"
" General Todos:
" - remove TODO, NOTE, etc. highlighting (i.e. folke/todo-comments.nvim), but
"   maybe keep that you can search for them in the quickfix list?
" - merge Trouble and quickfix list usage
" - some bufferline, integrated with harpoon maybe?
"
call plug#end()

" -------------- Theme Setup
set termguicolors
" colorscheme material-darker
colorscheme monokai-pro

" -------------- Keybindings

" ---- Telescope
" Search Files ([f]ind [f]iles)
nnoremap <leader>ff <cmd>Telescope frecency theme=dropdown<cr>
" Search Everything ([s]earch)
nnoremap <leader>s <cmd>Telescope live_grep<cr>
" Search paste yanks ([f]ind [y]anks)
nnoremap <leader>fy <cmd>Telescope neoclip theme=dropdown<cr>

" ---- QoL Keybindings
" Map Ctrl-Backspace to delete the previous word in insert mode.
"   see: https://vim.fandom.com/wiki/Map_Ctrl-Backspace_to_delete_previous_word
inoremap <C-BS> <C-w>
inoremap <C-h> <C-w>

" Same thing in command mode
cnoremap <C-BS> <C-w>
cnoremap <C-h> <C-w>

" Autocompletion on tab instead of enter (I don't know if this works (: )
inoremap <expr> <TAB> pumvisible() ? "<C-y>" : "<TAB>"

" Jump to next/previous function
map <C-j> ]m
map <C-k> [m

" Indenting
vnoremap <Tab> >gv
vnoremap <S-Tab> <gv
inoremap <S-Tab> <esc><S-v><gi

" Zen Mode
nnoremap <leader>z <cmd>ZenMode<cr>

" ---- LSP Keybindings
" Open documentation / hover hnformation [<S-k>] is default
nnoremap <S-k> <cmd>lua vim.lsp.buf.hover()<cr>

" Open signature help
nnoremap <leader>k <cmd>lua vim.lsp.buf.signature_help()<cr>

" [g]oto [d]efinition
nnoremap gd <cmd>lua vim.lsp.buf.definition()<cr>
" [g]oto [i]mplementation
nnoremap gi <cmd>lua vim.lsp.buf.implementation()<cr>

" [f]ind [i]mplementation
nnoremap <leader>fi <cmd>Trouble lsp_implementations<cr>

" TODO HERE
nnoremap <leader>fr <cmd>Trouble lsp_references<cr>
nnoremap <leader>r <cmd>lua vim.lsp.buf.rename()<cr>
nnoremap <leader>p <cmd>lua vim.lsp.buf.format({async = true})<cr>
" nnoremap <leader>ca <cmd>lua require('actions-preview').code_actions()<cr>
nnoremap <leader>ca <cmd>lua require('tiny-code-action').code_action()<cr>
nnoremap <leader>d <cmd>lua vim.diagnostic.open_float()<cr>
nnoremap <leader>ft <cmd>TodoLocList<cr>
nnoremap <leader>ih <cmd>lua vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())<cr>

" disabled
" nnoremap <leader>fi <cmd>lua vim.lsp.buf.implementation()<cr>
" nnoremap <leader>fr <cmd>lua vim.lsp.buf.references()<cr>

" Possible additional mappings
" nnoremap go <cmd>lua vim.lsp.buf.type_definition()<cr>
"
" Additional Trouble bindings
nnoremap <leader>fd <cmd>Trouble diagnostics<cr>
" nnoremap <leader>fD <cmd>Trouble workspace_diagnostics<cr>
nnoremap <leader>fs <cmd>lua vim.lsp.buf.document_symbol()<cr>

" Open filesystem tree
nnoremap <leader>t <cmd>Neotree toggle<cr>

lua << EOF
-- Theme Setups
require'material'.setup {
	plugins = {
		"nvim-cmp",
		"telescope",
		"illuminate",
	},
	lualine_style = "stealth",
	high_visibility = {
		darker = true,
	},
}

require'monokai-pro'.setup {
  background_clear = {
    "float_win",
    "telescope",
  }
}

-- BRACKETS AFTER FUNCTIONS SETUP
require'nvim-autopairs'.setup {
	disable_filetype = { "TelescopePrompt" , "guihua", "guihua_rust", "clap_input" },
}

if vim.o.ft == 'clap_input' and vim.o.ft == 'guihua' and vim.o.ft == 'guihua_rust' then
  require'cmp'.setup.buffer { completion = {enable = false} }
end

-- TELESCOPE SETUP
telescope = require'telescope'
telescope.setup {
	defaults = {
		scroll_strategy = "limit",
		file_ignore_pattern = { ".git/[^h]" },
		mappings = {
			i = {
				["<C-h>"] = { "<C-S-w>", type = "command"},
				-- Binding to delete whole words in insert mode using C-BS
				-- Expl.: Keys Ctrl+Backspace send Ctrl+h to the terminal,
				--		  so Ctrl+h needs to be remapped
				["<C-j>"] = "move_selection_next",
				["<C-k>"] = "move_selection_previous",
			}
		}, 
	},
	pickers = {
		find_files = {
			theme = "dropdown",
			initial_mode = "insert",
		},
		live_grep = {
			theme = "dropdown",
			initial_mode = "insert",
		},
		lsp_document_symbols = {
			theme = "dropdown",
			initial_mode = "insert",
		},
	},
	extensions = {
	  ---@type FrecencyOpts
		frecency = {
	    auto_validate = false,
			default_workspace = "CWD", -- help
			show_scores=true,

			-- additional config is in mapping
		}
	}
}

telescope.load_extension 'frecency'

-- TREESITTER SETUP
require'nvim-treesitter.configs'.setup {
	auto_install = true,

	highlight = { enable = true},
	indent = { enable = true },

  textobjects = {
    select = {
      enable = true,

      -- Automatically jump forward to textobj, similar to targets.vim
      lookahead = true,

      keymaps = {
        -- You can use the capture groups defined in textobjects.scm
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["ac"] = "@class.outer",
        -- You can optionally set descriptions to the mappings (used in the desc parameter of
        -- nvim_buf_set_keymap) which plugins like which-key display
        ["ic"] = { query = "@class.inner", desc = "Select inner part of a class region" },
        -- You can also use captures from other query groups like `locals.scm`
        ["as"] = { query = "@scope", query_group = "locals", desc = "Select language scope" },
      },
      -- You can choose the select mode (default is charwise 'v')
      --
      -- Can also be a function which gets passed a table with the keys
      -- * query_string: eg '@function.inner'
      -- * method: eg 'v' or 'o'
      -- and should return the mode ('v', 'V', or '<c-v>') or a table
      -- mapping query_strings to modes.
      selection_modes = {
        ['@parameter.outer'] = 'v', -- charwise
        ['@function.outer'] = 'V', -- linewise
        ['@class.outer'] = '<c-v>', -- blockwise
      },
      -- If you set this to `true` (default is `false`) then any textobject is
      -- extended to include preceding or succeeding whitespace. Succeeding
      -- whitespace has priority in order to act similarly to eg the built-in
      -- `ap`.
      --
      -- Can also be a function which gets passed a table with the keys
      -- * query_string: eg '@function.inner'
      -- * selection_mode: eg 'v'
      -- and should return true or false
      include_surrounding_whitespace = true,
    },
  },
}


-- AUTOCOMPLETION SETUP
local cmp_autopairs = require'nvim-autopairs.completion.cmp'
local luasnip = require'luasnip'
local cmp = require'cmp'

cmp.event:on(
  'confirm_done',
  cmp_autopairs.on_confirm_done()
) -- for autopairs

local lspkind = require'lspkind'
cmp.setup({
  preselect = "item",
  completion = {
    completeopt = 'menu,menuone,noinsert'
  },
  snippet = {
    expand = function(args)
		luasnip.lsp_expand(args.body)
    end,
  },
  formatting = {
	fields = { "kind", "abbr", "menu" },
	format = function(entry, vim_item)
      local kind = require("lspkind").cmp_format({ mode = "symbol_text", maxwidth = 50})(entry, vim_item)
      local strings = vim.split(kind.kind, "%s", { trimempty = true })
      kind.kind = " " .. (strings[1] or "") .. " "
      kind.menu = "    (" .. (strings[2] or "") .. ")"

      return kind
    end,
  },
  window = {
	completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
  mapping = cmp.mapping.preset.insert({
	['<CR>'] = cmp.mapping.confirm({ select = true }), 
    ['<C-j>'] = cmp.mapping(function(fallback) 
		if cmp.visible() then
			cmp.select_next_item()
		else 
			fallback()
		end
	  end, {"i", "s", "c"}),
    ['<C-k>'] = cmp.mapping(function(fallback) 
		if cmp.visible() then
			cmp.select_prev_item()
		else 
			fallback()
		end
	  end, {"i", "s", "c"}),
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping(function(fallback)
	  if not cmp.visible() then
		  cmp.complete({ select = true })
	  else 
		  fallback()
	  end
	end, {"i", "s"}),
    ['<C-e>'] = cmp.mapping.abort(),
	["<Tab>"] = cmp.mapping(function(fallback)
	  if cmp.visible() then
		cmp.confirm({ select = true })
	  elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { "i", "s"}),

    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { "i", "s"}),
  }),
  sources = cmp.config.sources(
	{{ name = 'nvim_lsp' }, { name = 'luasnip' }},
	{{ name = 'buffer' }}
  )
})

cmdline_mapping = {
  ["<Tab>"] = {
    c = function(fallback)
      if cmp.visible() then
		cmp.confirm({ select = true })
      else
        fallback()
      end
    end,
  },
}

cmp.setup.cmdline({ '/', '?' }, {
  mapping = cmp.mapping.preset.cmdline(cmdline_mapping),
  sources = {
    { name = 'buffer' }
  }
})

cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(cmdline_mapping),
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
    { name = 'cmdline' }
  })
})


-- LSP UI SETUP
local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
  -- see :help lsp-zero-keybindings
  -- to learn the available actions
  -- lsp_zero.default_keymaps({buffer = bufnr})
end)

lsp_zero.set_sign_icons({
  error = '✘',
  warn = '▲',
  hint = '⚑',
  info = '»'
})

-- LSP INSTALLER SETUP
require'mason'.setup {}
require'mason-lspconfig'.setup {}
require'mason-lspconfig'.setup_handlers {
	function (server_name)
		require("lspconfig")[server_name].setup {}
	end,
	["typst_lsp"] = function() 
		require'lspconfig'.typst_lsp.setup {
			settings = {
				exportPdf = "onSave"
			},
		}
	end,
	["ltex"] = function()
		require'lspconfig'.ltex.setup {
			settings = {
				ltex = {
					-- language = "en-US",
					language = "de-DE",
				}
			},
			-- filetypes = { "bib", "gitcommit", "markdown", "org", "plaintex", "rst", "rnoweb", "tex", "pandoc", "quarto", "rmd", "typst"}
			filetypes = { "bib", "gitcommit", "markdown", "org", "plaintex", "rst", "rnoweb", "tex", "pandoc", "quarto", "rmd"}
		}
	end,
	["texlab"] = function()
		require'lspconfig'.texlab.setup {
      auxDirectory = "latex.out",
      bibtexFormatter = "texlab",
      build = {
        executable = "latexrun",
        args = { "--latex-cmd 'lualatex'", "--latex-args '--interaction=nonstopmode --synctex=1'", "%f"},
        forwardSearchAfter = true,
        onSave = true
      },
      chktex = {
        onEdit = false,
        onOpenAndSave = false
      },
      diagnosticsDelay = 300,
      formatterLineLength = 80,
      forwardSearch = {
        args = {}
      },
      latexFormatter = "latexindent",
      latexindent = {
        modifyLineBreaks = false
      }

		}
	end,
}
-- require'navigator'.setup {
--   default_mapping = false,
--   transparency = 10,
--   mason = true,
--
--   ts_fold = {
-- 	  enable = false,
--   },
--
--   lsp = {
-- 	format_on_save = false, 
-- 	code_lens_action = { enable = false },
--   },
--   icons = {
--     icons = true,
--     code_action_icon = "💡",
--   },
--
--   keymaps = {
-- 	{ key = '<leader>fs', func = require('navigator.symbols').document_symbols, desc = 'document_symbols' },
-- 	{ key = '<leader>fu', func = require('navigator.reference').async_ref, desc = 'async_ref' },
-- 	{ key = 'gd', func = require('navigator.definition').definition, desc = 'definition' },
-- 	{ key = 'gpd', func = require('navigator.definition').definition_preview, desc = 'definition_preview' },
-- 	{ key = 'gt', func = vim.lsp.buf.type_definition, desc = 'type_definition' },
-- 	{ key = 'gpt', func = require('navigator.definition').type_definition_preview, desc = 'type_definition_preview' },
-- 	-- I think so { key = 'gi', func = vim.lsp.buf.implementation, desc = 'implementation' },
-- 	-- Refactoring
-- 	{ key = '<leader>r', func = require('navigator.rename').rename, desc = 'rename' },
-- 	{ key = '<leader>p', mode = 'n', func = vim.lsp.buf.format, desc = 'format' },
-- 	{ key = '<leader>p', mode = 'v', func = vim.lsp.buf.range_formatting, desc = 'range format' },
-- 	{ key = '<leader>ca', mode = 'n', func = require('navigator.codeAction').code_action, desc = 'code_action' },
--   },
-- }
--
-- require'guihua.maps'.setup {
--   maps = {
-- 	prev = '<C-k>',
--     next = '<C-j>',
--   }
-- }



-- Neotree
require'neo-tree'.setup {
  filesystem = {
    hijack_netrw_behavior = "open_current"
  }
}

-- Oil
-- require'oil'.setup {}

-- leap
-- require('leap').create_default_mappings()

-- QoL
-- Smarter cursorline management
require'reticle'.setup {
	on_startup = {
		cursorline = true,
	},

	disable_in_insert = false,
}


require'lualine'.setup {
	sections = {
		lualine_a = {'mode',},
		lualine_b = {'filename', 'diagnostics'},
		lualine_c = {'branch', 'diff', 'lsp_progress'},
		lualine_x = {'encoding', 'fileformat', 'filetype'},
		lualine_y = {'progress'},
		lualine_z = {'location'}
	},
	globalstatus = true,
}

---- TODO highlighting
require'todo-comments'.setup {}

---- harpoon
-- setup for harpoon2
local harpoon = require'harpoon' 

harpoon:setup {}

vim.keymap.set("n", "<Space>fh", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)
vim.keymap.set("n", "<Space>m", function() harpoon:list():append() end)

vim.keymap.set("n", "<Space>h", function() harpoon:list():prev() end)
vim.keymap.set("n", "<Space>l", function() harpoon:list():next() end)

vim.keymap.set("n", "<Space>1", function() harpoon:list():select(1) end)
vim.keymap.set("n", "<Space>2", function() harpoon:list():select(2) end)
vim.keymap.set("n", "<Space>3", function() harpoon:list():select(3) end)
vim.keymap.set("n", "<Space>4", function() harpoon:list():select(4) end)
vim.keymap.set("n", "<Space>5", function() harpoon:list():select(5) end)
vim.keymap.set("n", "<Space>6", function() harpoon:list():select(6) end)

harpoon:extend({
  UI_CREATE = function(cx)
    --vim.keymap.set("n", "<C-v>", function()
    --  harpoon.ui:select_menu_item({ vsplit = true })
    --end, { buffer = cx.bufnr })

    --vim.keymap.set("n", "<C-x>", function()
    --  harpoon.ui:select_menu_item({ split = true })
    --end, { buffer = cx.bufnr })

    vim.keymap.set("n", "<C-t>", function()
      harpoon.ui:select_menu_item({ tabedit = true })
    end, { buffer = cx.bufnr })
  end,
})

--- winbar
require'barbecue'.setup {}

--- neoclip
require'neoclip'.setup {
	keys = {
		telescope = {
			i = {
				paste_behind = "<Nop>"
			}
		}
	}
}

--- automatic indentation guessing
require'guess-indent'.setup {}

-- easier commenting
require'Comment'.setup {}

-- Trouble setup
require'trouble'.setup {}

-- code actions preview
-- require("actions-preview").setup {
-- 	-- backend = {"nui", "telescope"}
-- }

-- tiny code actions
require'tiny-code-action'.setup {
  backend = "vim",
  telescope_opts = {
		layout_strategy = "vertical",
		layout_config = {
			width = 0.5,
			height = 0.6,
			preview_cutoff = 1,
			preview_height = function(_, _, max_lines)
				local h = math.floor(max_lines * 0.5)
				return math.max(h, 10)
			end,
		},
	},
}

-- bqf
require'bqf'.setup {
	auto_resize_height = false,
	preview = {
		winblend = 0,
	}
}

local fn = vim.fn

function _G.qftf(info)
    local items
    local ret = {}
    -- The name of item in list is based on the directory of quickfix window.
    -- Change the directory for quickfix window make the name of item shorter.
    -- It's a good opportunity to change current directory in quickfixtextfunc :)
    --
    -- local alterBufnr = fn.bufname('#') -- alternative buffer is the buffer before enter qf window
    -- local root = getRootByAlterBufnr(alterBufnr)
    -- vim.cmd(('noa lcd %s'):format(fn.fnameescape(root)))
    
    if info.quickfix == 1 then
        items = fn.getqflist({id = info.id, items = 0}).items
    else
        items = fn.getloclist(info.winid, {id = info.id, items = 0}).items
    end
    local limit = 31
    local fnameFmt1, fnameFmt2 = '%-' .. limit .. 's', '…%.' .. (limit - 1) .. 's'
    local validFmt = '%s │%5d:%-3d│%s %s'
    for i = info.start_idx, info.end_idx do
        local e = items[i]
        local fname = ''
        local str
        if e.valid == 1 then
            if e.bufnr > 0 then
                fname = fn.bufname(e.bufnr)
                if fname == '' then
                    fname = '[No Name]'
                else
                    fname = fname:gsub('^' .. vim.env.HOME, '~')
                end
                -- char in fname may occur more than 1 width, ignore this issue in order to keep performance
                if #fname <= limit then
                    fname = fnameFmt1:format(fname)
                else
                    fname = fnameFmt2:format(fname:sub(1 - limit))
                end
            end
            local lnum = e.lnum > 99999 and -1 or e.lnum
            local col = e.col > 999 and -1 or e.col
            local qtype = e.type == '' and '' or ' ' .. e.type:sub(1, 1):upper()
            str = validFmt:format(fname, lnum, col, qtype, e.text)
        else
            str = e.text
        end
        table.insert(ret, str)
    end
    return ret
end

vim.o.qftf = '{info -> v:lua._G.qftf(info)}'

-- nvim-surround
-- require'nvim-surround'.setup {
-- }
-- mini.surround
require'mini.surround'.setup {}

-- zen mode
require'zen-mode'.setup {}

--- TMUX INTEGRATION SETUP
local tmux = require('tmux')
tmux.setup {
  navigation = {
      enable_default_keybindings = false,
  },
  resize = {
      enable_default_keybindings = false,
  }
}

-- Navigation around panes (including tmux)
vim.keymap.set("n", "<C-A-h>", function() tmux.move_left() end)
vim.keymap.set("n", "<C-A-j>", function() tmux.move_bottom() end)
vim.keymap.set("n", "<C-A-k>", function() tmux.move_top() end)
vim.keymap.set("n", "<C-A-l>", function() tmux.move_right() end)

-- Resizing panes (including tmux)
vim.keymap.set("n", "<A-h>", function() tmux.resize_left() end)
vim.keymap.set("n", "<A-j>", function() tmux.resize_bottom() end)
vim.keymap.set("n", "<A-k>", function() tmux.resize_top() end)
vim.keymap.set("n", "<A-l>", function() tmux.resize_right() end)


--- LANGUAGE SUPPORT SETUP
-- vim.g.typst_conceal = 1

EOF

" Highlighted Yank (after this line lua highlighting is weird)
au TextYankPost * silent! lua vim.highlight.on_yank() 
