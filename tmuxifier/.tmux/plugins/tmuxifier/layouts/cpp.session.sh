# Set a custom session root path. Default is `$HOME`.
# Must be called before `initialize_session`.
OSX_HOME="/Users/juliencm"  # Remove spaces around the = sign
if [ -n "$ZSH_VERSION" ]; then
  # Running in ZSH
  ACTUAL_HOME=$OSX_HOME
  echo "ZSH detected, using actual home: $ACTUAL_HOME"
else
  # Running in other shells (bash, etc.)
  ACTUAL_HOME="$HOME"
  echo "Using standard HOME: $ACTUAL_HOME"
fi
session_root "$ACTUAL_HOME/project/school/concordia/COMP-345"
# Create session with specified name if it does not already exist. If no
# argument is given, session name will be based on layout file name.
if initialize_session "comp-345"; then
  new_window "server"
  run_cmd "cd $session_root/server && clear && nvim ."
fi
# Finalize session creation and switch/attach to it.
finalize_and_go_to_session
