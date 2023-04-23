(module joonas.plugin.comment
  {autoload {: Comment}})

(Comment.setup
  {:pre_hook (fn [ctx]
               (let [u (require :Comment.utils)
                     csu (require :ts_context_commentstring.utils)
                     csi (require :ts_context_commentstring.internal)
                     location (if
                                (= (. ctx :ctype) (. u :ctype :block))
                                (csu.get_cursor_location)
                                (or (= (. ctx :cmotion) (. u :cmotion :v)))
                                (csu.get_visual_start_location))]
                 (csi.calculate_commentstring
                   {:key (if (= (. ctx :ctype) (. u :ctype :line))
                           "__default"
                           "__multiline")
                    :location location})))})
