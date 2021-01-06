local util = require 'lspconfig/util'

local server_name = "bashls"

return {
  default_config = {
    cmd = {"bash-language-server", "start"};
    filetypes = {"sh"};
    root_dir = util.path.dirname;
  };
  docs = {
    description = [[
https://github.com/mads-hartmann/bash-language-server

Language server for bash, written using tree sitter in typescript.
]];
    default_config = {
      root_dir = "vim's starting directory";
    };
  };
};

-- vim:et ts=2 sw=2
