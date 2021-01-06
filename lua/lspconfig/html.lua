local util = require 'lspconfig/util'

local server_name = "html"
local bin_name = "html-languageserver"

local root_pattern = util.root_pattern("package.json")

return {
  default_config = {
    cmd = {bin_name, "--stdio"};
    filetypes = {"html"};
    root_dir = function(fname)
      return root_pattern(fname) or vim.loop.os_homedir()
    end;
    settings = {};
    init_options = {
      embeddedLanguages = { css= true, javascript= true },
      configurationSection = { 'html', 'css', 'javascript' },
    }

  };
  docs = {
    description = [[
https://github.com/vscode-langservers/vscode-html-languageserver-bin

`html-languageserver` can be installed via `npm`:
```sh
npm install -g vscode-html-languageserver-bin
```
]];
  };
}

-- vim:et ts=2 sw=2
