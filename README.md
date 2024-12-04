# minline.nvim

> [!NOTE]
>
> This probably won't work on your machine

Inspired by
[mini.statusline](https://github.com/echasnovski/mini.statusline)

[el](https://github.com/tjdevries/express_line.nvim)

## usage:

```lua
{
    "github.com/musaubrian/minline.nvim",
    config = function()
        require("minline").setup()
    end
}

```

## Todo
- [ ] show active lsp?
- [x] filename
- [ ] filetype
- [x] Git branch
- [ ] Better way of doing git branches?

## Highlight Groups
| Group                | Purpose*                       |
| ---                  | ---                            |
| MinLineMode          | Active Mode                    |
| MinLineGitBranch     | Active Git branch              |
| MinLinePrimaryText   | Text thats kinda important     |
| MinLineSecondaryText | Text thats kinda not important |

