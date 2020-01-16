gem_export() {
  gem list --local
}

gem_import() {
  [[ -f "$1" ]] || { echo "Usage: Expecting valid gems file path" >&2; return; }
  awk '{ print $1 }' "$1" | xargs gem install --conservative
}
