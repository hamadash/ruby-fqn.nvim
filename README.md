<a href="https://github.com/hamadash/ruby-fqn.nvim/releases/latest"><img src="https://img.shields.io/github/release/hamadash/ruby-fqn.nvim.svg" /></a>

# ruby-fqn.nvim (Ruby Fully Qualified Name)

## Features

- Extracts the class or module name with namespaces (e.g. `Hoge::Fuga::Foo`).

  ```ruby
  module Hoge
    module Fuga
      class Foo
        # ...
      end
    end
  end
  ```

- Copies the name to the clipboard.

## Requirements

- Neovim 0.10 or higher.

## Installation

### lazy.nvim

```lua
return {
  {
    "hamadash/ruby-fqn.nvim",
    config = function()
      require("ruby-fqn")
    end,
    keys = {
      -- e.g.
      { "<Leader>crn", "<Cmd>RubyFQN CopyName<CR>", mode = "n" },
    },
  },
}
```
