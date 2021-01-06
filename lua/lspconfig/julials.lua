local util = require 'lspconfig/util'

local environment_directory = util.path.join(util.base_install_dir, "julials")

return {
  default_config = {
    cmd = {
        "julia", "--project=" .. environment_directory, "--startup-file=no", "--history-file=no", "-e", [[
        using Pkg;
        Pkg.instantiate()
        using LanguageServer; using SymbolServer;
        depot_path = get(ENV, "JULIA_DEPOT_PATH", "")
        project_path = dirname(something(Base.current_project(pwd()), Base.load_path_expand(LOAD_PATH[2])))
        # Make sure that we only load packages from this environment specifically.
        empty!(LOAD_PATH)
        push!(LOAD_PATH, "@")
        @info "Running language server" env=Base.load_path()[1] pwd() project_path depot_path
        server = LanguageServer.LanguageServerInstance(stdin, stdout, project_path, depot_path);
        server.runlinter = true;
        run(server);
        ]]
    };
    filetypes = {'julia'};
    root_dir = function(fname)
      return util.find_git_ancestor(fname) or vim.loop.os_homedir()
    end;
  };
  docs = {
    package_json = "https://raw.githubusercontent.com/julia-vscode/julia-vscode/master/package.json";
    description = [[
https://github.com/julia-vscode/julia-vscode
`LanguageServer.jl` can be installed with `julia` and `Pkg`:
```sh
julia --project=]] .. environment_directory .. [[ -e 'using Pkg; Pkg.add("LanguageServer"); Pkg.add("SymbolServer")'
```
If you want to install the LanguageServer manually, you will have to ensure that the Julia environment is stored in this location:
```vim
:lua print(require'lspconfig'.util.path.join(require'lspconfig'.util.base_install_dir, "julials"))
```
    ]];
  };
}

--- vim:et ts=2 sw=2
