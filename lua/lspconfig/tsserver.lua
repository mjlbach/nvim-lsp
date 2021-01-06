local configs = require 'lspconfig/configs'
local util = require 'lspconfig/util'

local server_name = "tsserver"
local bin_name = "typescript-language-server"
if vim.fn.has('win32') == 1 then
  bin_name = bin_name..".cmd"
end

return {
  default_config = {
    cmd = {bin_name, "--stdio"};
    filetypes = {"javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx"};
    root_dir = util.root_pattern("package.json", "tsconfig.json", "jsconfig.json", ".git");
  };
  docs = {
    description = [[
https://github.com/theia-ide/typescript-language-server

`typescript-language-server` depends on `typescript`. Both packages can be installed via `npm`:
```sh
npm install -g typescript typescript-language-server
```
]];
    default_config = {
      root_dir = [[root_pattern("package.json", "tsconfig.json", "jsconfig.json", ".git")]];
    };
  };
}

-- vim:et ts=2 sw=2
