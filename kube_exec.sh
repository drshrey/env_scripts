# Exec into pod with given name e.g. codeamp-circuit-circuit -> circuit is the short name

if [ $# -eq 0 ]
then
  echo "please input a pod name"
  exit 1
fi

count=0
max=0
if [ "$2" != "" ]
then
  max=$2
fi

arr=($(kubectl get pods))
for element in "${arr[@]}"
do
  # check if word in string
  if [[ $element = *$1* ]]; then
    # split on '-' and check 3rd element
    A="$(cut -d'-' -f3 <<<"$element")"
    if [ "$A" == $1 ]; then
      if [ $count == $max ]; then
        echo $element
        kubectl exec -it $element /bin/sh
      fi
      max=$max+1
    fi
  fi
done

