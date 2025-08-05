
set linebreak " wrap on space etc, not on characters
" set cursorlineopt=number,screenline " this way, cursorline only shows in screenline
set cursorlineopt=screenline,number " this way, cursorline only shows in screenline
set conceallevel=2

" Custom mappings for Typst

" walk buffer by visual lines, not by actual lines
" useful when lines are softwrapped
noremap j gj
noremap k gk
noremap ^ g^
noremap $ g$

" lua <<EOF
" 
" -- Add spelling source to cmp
" local cmp = require'cmp'
" local config = cmp.get_config()
" 
" table.insert(config.sources, { name="spell", })
" EOF
"
" lua <<EOF
" local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
" parser_config.typst = {
"   install_info = {
"     url = "~/Projekte/tree-sitter-typst", -- local path or git repo
"     files = {"src/parser.c"}, -- note that some parsers also require src/scanner.c or src/scanner.cc
"   },
"   filetype = "typ", -- if filetype does not match the parser name
" }
" EOF

