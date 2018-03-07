# Exec into pod with given name e.g. codeamp-circuit-circuit -> circuit is the short name

arr=($(kubectl get pods))
for element in "${arr[@]}"
do
  # check if word in string
  if [[ $element = *$1* ]]; then
    # split on '-' and check 3rd element
    A="$(cut -d'-' -f3 <<<"$element")"
    if [ "$A" == $1 ]; then
      echo $element
      kubectl exec -it $element /bin/sh
    fi
  fi
done

