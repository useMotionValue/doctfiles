local status, prettier = pcall(require, 'prettier')
if (not status) then return end

prettier.setup {
  bin = 'prettierd',
  filetypes = {
    'css',
    'javascript',
    'javascriptreact',
    'typescript',
    'typescriptreact',
    'json',
    'scss',
    'less',
    'html',
    'yarm',
    'graphql',
    'markdown'
  },
  cli_options = {
    singleQuote = false,
    jsxSingleQuote = false,
    semi = false,
    useTabs = false,
    tabWidth = 2,
    bracketSpacing = true,
    jsxBracketSameLine = false,
    endOfLine = "lf",
    arrowParens = "avoid",
    trailingComma = "none"
  }
}
