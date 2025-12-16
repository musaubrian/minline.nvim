# minline.nvim

> [!NOTE]
>
> This probably won't work on your machine

Inspired by
[mini.statusline](https://github.com/nvim-mini/mini.statusline) |
[el](https://github.com/tjdevries/express_line.nvim)

## usage:

```lua
{
    "github.com/musaubrian/minline.nvim",
    dependencies = {
        "lewis6991/gitsigns.nvim",
    }
    opts = {}
}

```

## Todo
~[ ] show active lsp?~
~[ ] filetype~

> Don't really need the lsp
> Filetypes are on the name so no need as well

- [x] filename
- [x] Git branch
- [ ] Better way of doing git branches?

## Highlight Groups

| Group                | Purpose*                       |
| ---                  | ---                            |
| MinLineMode          | Active Mode                    |
| MinLineGitBranch     | Active Git branch              |
| MinLinePrimaryText   | Text thats kinda important     |
| MinLineSecondaryText | Text thats kinda not important |

