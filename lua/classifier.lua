local classifier = {}

classifier.fts = setmetatable({
  clojure = {"clj", "cljc", "cljs", "edn"},
  python = {"py", "py3"},
  sh = {"sh", "bash"},
  c = {"c", "h"},
}, {
  __call = function(tbl, k)
    local extensions = rawget(tbl, k)
    return extensions and extensions[1] or {k}
  end
})

classifier.exts = setmetatable({}, {
    __index = function(tbl, ext)
      -- Lazily loads missing extensions to this list.
      -- Can be further improved.
      local this_ft = nil
      for ft, exts in pairs(classifier.fts) do
        for _, ft_ext in ipairs(exts) do
          rawset(tbl, ft_ext, ft)
          if ft_ext == ext then
            this_ft = ft
            break
          end
        end
      end

      return this_ft or ext
    end
})

return classifier
