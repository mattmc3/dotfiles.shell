up() {
  if [[ "$#" < 1 ]] ; then
    cd ..
  else
    local rpt=$(printf "%${1}s")
    local cdstr=${rpt// /..\/}
    cd $cdstr
  fi
}
