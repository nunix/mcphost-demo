# MCP Host aliases and functions
if [ -f ~/.secrets ]; then source ~/.secrets; fi

function hal {
  # Catch empty prompts
  if [[ -z "$1" ]]; then
    echo "Usage: hal <your command>"
    return 1
  fi

  # Pointing to the .pro.yaml config
  mcphost --config "$HOME/mcphost/.mcphost.pro.yaml" --prompt "$*"
}

function minihal {
  # Catch empty prompts
  if [[ -z "$1" ]]; then
    echo "Usage: minihal <your command>"
    return 1
  fi

  # Pointing to the .minimal.yaml config
  mcphost --config "$HOME/mcphost/.mcphost.minimal.yaml" --prompt "$*"
}
