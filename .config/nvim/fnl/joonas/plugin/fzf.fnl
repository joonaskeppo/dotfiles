(module joonas.plugin.fzf
  {autoload {nvim aniseed.nvim}})

(set nvim.g.fzf_colors
     {:fg [ "fg" "Normal" ]
      :bg [ "bg" "Normal" ]
      :fg+ [ "fg" "CursorLine" "CursorColumn" "Normal" ]
      :bg+ [ "bg" "CursorLine" "CursorColumn" ]
      :hl+ [ "fg" "Statement" ]
      :info [ "fg" "PreProc" ]
      :border [ "fg" "Normal" ]
      :prompt [ "fg" "Conditional" ]
      :pointer [ "fg" "Exception" ]
      :marker [ "fg" "Keyword" ]
      :spinner [ "fg" "Label" ]
      :header [ "fg" "Comment" ]})
