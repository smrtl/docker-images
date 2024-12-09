# debian-sshd

Debian image that starts an SSH daemon as a non root user.

- Docker Hub: https://hub.docker.com/r/smrtl/debian-sshd
- The apt cache has not been cleared on purpose as the user might install some package.

## Kubernetes

Typical usage for this image is remote development from VSCode inside a kubernetes cluster. Below is
a bash function that will help create and destroy a pod with this image :

```sh
ksshd() {
  local name=${2:-dbgsshd}
  if [[ $1 == "create" ]]; then
    (
        echo "apiVersion: v1"
        echo "kind: Pod"
        echo "metadata:"
        echo "  name: $name"
        echo "  labels:"
        echo "    app: $name"
        echo "spec:"
        echo "  containers:"
        echo "  - name: main"
        echo "    image: smrtl/debian-sshd"
        echo "    ports:"
        echo "    - containerPort: 2222"
        echo "      protocol: TCP"
    ) | k create -f -
  elif [[ $1 == "delete" ]]; then
    k delete pod $name
  else
    echo "usage:"
    echo "  ksshd create [name]"
    echo "  ksshd delete [name]"
  fi
}
```
