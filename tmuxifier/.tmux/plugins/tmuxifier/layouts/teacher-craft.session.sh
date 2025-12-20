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

session_root "$ACTUAL_HOME/project/work/teacher-craft-api"
ui_root="$ACTUAL_HOME/project/work/teacher-craft-web"

# Create session with specified name if it does not already exist. If no
# argument is given, session name will be based on layout file name.
if initialize_session "teacher-craft"; then
  new_window "server"
  split_h 33
  select_pane 1
  run_cmd "cd $session_root && clear && nvim ."
  new_window "client"
  split_h 33
  select_pane 1
  run_cmd "cd $ui_root && clear && nvim ."
  new_window "api-git"
  run_cmd "cd $session_root && lazygit"
  new_window "ui-git"
  run_cmd "cd $ui_root && lazygit"
  select_window 1
fi
# Finalize session creation and switch/attach to it.
finalize_and_go_to_session
