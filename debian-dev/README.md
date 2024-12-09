# debian-dev

Debian image with some useful helpers for development.

- The apt cache has not been cleared on purpose as the user might install some package.

## Kubernetes

Example Bash function to create or destroy a pod with this image.

```sh
kdev() {
  local name=debian-dev
  for v in "$@"; do declare "${v%%=*}=${v#*=}"; done

  if [ $# -eq 0 ]; then
    local pod=$(kgp -l app=$name -o name)
    if [ -z "$pod" ]; then
      echo "$name not found, please create it first (kdeb create)"
    else
      echo "found $pod, starting bash..."
      k exec -ti $pod -- bash
    fi
  elif [[ $1 == "create" ]]; then
    (
      echo "apiVersion: v1"
      echo "kind: Pod"
      echo "metadata:"
      echo "  name: $name"
      echo "  labels:"
      echo "    app: $name"
      echo "spec:"
      if [ -n "$label" ]; then
        echo "  nodeSelector:"
        echo "    ${label%%=*}: \"${label#*=}\""
      fi
      echo "  containers:"
      echo "  - name: debian"
      echo "    image: smrtl/debian-dev"
      echo '    command: ["/bin/sh"]'
      echo '    args: ["-c", "while true; do sleep 10; done"]'
      if [ -n "$toleration" ]; then
        echo '  tolerations:'
        echo "  - key: \"${toleration%%=*}\""
        echo "    operator: \"Equal\""
        echo "    value: \"${toleration#*=}\""
        echo "    effect: \"NoSchedule\""
      fi
    ) | k create -f -
  elif [[ $1 == "delete" ]]; then
    k delete pod $name
  else
    echo "usage: kdeb [create|delete] [label=key=value] [toleration=key=value]"
  fi
}
```
