cd scripts
scripts=$(ls -A)

for script in $scripts; do
  chmod +x $script

  SCRIPT_PATH=$(realpath $script)

  if [ -f "$SCRIPT_PATH" ]; then
    rm -f ~/.local/bin/$script
    ln -s $SCRIPT_PATH ~/.local/bin/
  fi
done
