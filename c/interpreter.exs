#!/usr/bin/env elixir

partials =
  [
    "table",
    "form",
    "thumbnail",
    "progress",
    "helpers",
    "alert"
  ]

main_content = File.read!(Path.expand("organizer"))

Path.expand("material.css")
|> File.write!(Enum.reduce(partials, main_content, fn p, acc ->
  content = File.read!(Path.expand("material-#{p}.css"))
  String.replace(acc, "->#{p}", content)
end))
