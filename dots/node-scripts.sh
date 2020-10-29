#!/bin/bash

CMD='ns'

select_node_script() {
  packge_json=$(pkg)
  cat $(pkg) | jq .scripts
}

alias $CMD='select_node_script 2>&1'
