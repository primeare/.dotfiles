function __fish_complete_aws
  env COMP_LINE=(commandline --current-process --cut-at-cursor) aws_completer | tr -d ' '
end

complete --command aws --no-files --arguments "(__fish_complete_aws)"
