{ helpers, ... }: {
  plaintext = { element }: let
    hexElement = helpers.elementToFormattedHex element;
    inherit (hexElement) surface accent tokens;
  in /* toml */ ''
  [mgr]
  cwd = { fg = "${tokens.primary}" }
  hovered         = { reversed  = true }
  preview_hovered = { underline = true }

  # find
  find_keyword  = { fg = "${accent.light_yellow}", bold = true,    italic = true, underline = true }
  find_position = { fg = "${accent.light_orange}", bg   = "reset", bold   = true, italic    = true }

  # marker
  marker_copied   = { fg = "${accent.light_green}", bg = "${accent.light_green}" }
  marker_cut      = { fg = "${accent.light_red}",   bg = "${accent.light_red}" }
  marker_marked   = { fg = "${accent.light_blue}",  bg = "${accent.light_blue}" }
  marker_selected = { fg = "${tokens.primary}",     bg = "${tokens.primary}" }

  # count
  count_copied   = { fg = "${surface.crust}", bg = "${accent.light_green}" }
  count_cut      = { fg = "${surface.crust}", bg = "${accent.light_red}" }
  count_selected = { fg = "${surface.crust}", bg = "${tokens.primary}" }

  # border
  border_symbol = "│"
  border_style = { fg = "${surface.surface1}" }


  [tabs]
  active   = { fg = "${surface.crust}", bg = "${tokens.primary}", bold = true }
  inactive = { fg = "${tokens.primary}", bg = "${surface.base}" }


  [mode]
  normal_main = { fg = "${surface.crust}", bg = "${tokens.primary}",     bold = true }
  normal_alt  = { fg = "${tokens.primary}", bg = "${surface.base}" }
  select_main = { fg = "${surface.crust}", bg = "${accent.light_green}", bold = true }
  select_alt  = { fg = "${accent.light_green}", bg = "${surface.base}" }
  unset_main  = { fg = "${surface.crust}", bg = "${accent.light_red}",   bold = true }
  unset_alt   = { fg = "${accent.light_red}", bg = "${surface.base}" }


  [status]
  perm_sep   = { fg = "${surface.overlay0}" }
  perm_type  = { fg = "${accent.light_blue}" }
  perm_read  = { fg = "${accent.light_yellow}" }
  perm_write = { fg = "${accent.light_red}" }
  perm_exec  = { fg = "${accent.light_green}" }

  progress_label =  { fg = "${surface.text}", bold = true }
  progress_normal = { fg = "${accent.light_green}", bg = "${surface.surface0}" }
  progress_error =  { fg = "${tokens.warning}", bg = "${tokens.error}" }


  [pick]
  border = { fg = "${surface.surface1}" }
  active = { fg = "${tokens.primary}" }
  inactive = {}


  [input]
  border   = { fg = "${tokens.primary}" }
  title    = {}
  value    = {}
  selected = { reversed = true }


  [cmp]
  border = { fg = "${surface.surface0}" }


  [tasks]
  border  = { fg = "${surface.surface0}" }
  title   = {}
  hovered = { fg = "${tokens.primary}", bold = true }


  [which]
  mask            = { bg = "${surface.surface0}" }
  cand            = { fg = "${accent.light_green}" }
  rest            = { fg = "${surface.overlay0}" }
  desc            = { fg = "${accent.light_yellow}" }
  separator       = "  "
  separator_style = { fg = "${surface.subtext0}" }


  [help]
  on      = { fg = "${accent.light_green}" }
  run     = { fg = "${accent.light_red}" }
  hovered = { reversed = true, bold = true }
  footer  = { fg = "${surface.surface0}", bg = "${surface.subtext0}" }


  [spot]
  border   = { fg = "${surface.surface0}" }
  title    = { fg = "${tokens.primary}" }
  tbl_col  = { fg = "${accent.light_blue}" }
  tbl_cell = { fg = "${surface.subtext0}", bg = "${surface.overlay0}" }


  [notify]
  title_info  = { fg = "${tokens.info}" }
  title_warn  = { fg = "${tokens.warning}" }
  title_error = { fg = "${tokens.error}" }


  [filetype]
  rules = [
    # Image
    { mime = "image/*", fg = "${accent.light_green}" },
    # Media
    { mime = "{audio,video}/*", fg = "${accent.light_yellow}" },
    # Archive
    { mime = "application/{zip,rar,7z*,tar,gzip,xz,zstd,bzip*,lzma,compress,archive,cpio,arj,xar,ms-cab*}", fg = "${accent.light_red}" },
    # Document
    { mime = "application/{pdf,doc,rtf}", fg = "${accent.green}" },
    # Virtual file system
    { mime = "vfs/{absent,stale}", fg = "${surface.overlay0}" },
    # Broken Links
    { name = "*", is = "orphan", fg = "${accent.red}" },
    # Executables
    { name = "*", is = "exec", fg = "${accent.orange}" },
    # Fallback
    { name = "*", fg = "${surface.overlay1}" },
    { name = "*/", fg = "${surface.subtext0}" },
  ]
  '';
}
