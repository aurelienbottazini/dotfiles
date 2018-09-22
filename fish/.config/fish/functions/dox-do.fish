function dox-do
  dox-dc exec (dox-repo) $argv
end

function dox-repo
  git rev-parse --show-toplevel 2> /dev/null | xargs basename 2> /dev/null
end