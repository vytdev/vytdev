local lsp = require("lsp-zero")

lsp.setup_servers({ "lua_ls", "pyright", "ts_ls", "clangd", "taplo" })
lsp.setup()
