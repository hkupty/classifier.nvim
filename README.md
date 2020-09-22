# classifier.nvim

## Why?

This is a very, *very* simple mapping of `ft` to file extension and the other way around.
Should be used by plugin authors or users to glue together commands/plugins.

## Caveats

Filetype to extensions is faster than extension to filetype. In order to avoid duplication, the extensions list is lazily populated.

## Usage

```lua
local classifier = require("classifier")

-- Sample usage
local icons = require("nvim-web-devicons")

icons.get_icon(filename, classifier.ext(vim.bo.ft)[1])

-- another example
vim.fn.systemlist("rg --vimgrep -g '*.{" .. table.concat(classifier.ext(ft), ",") .. "}' -- " .. some_search)
```
