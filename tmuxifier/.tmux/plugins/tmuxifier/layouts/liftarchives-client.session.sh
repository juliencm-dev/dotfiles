
#!/bin/bash

# Set a custom session root path for macOS
OSX_HOME="/Users/juliencm"

# Detect shell and set appropriate root directory
if [ -n "$ZSH_VERSION" ]; then
  # Running in ZSH
  ACTUAL_HOME=$OSX_HOME
  echo "ZSH detected, using actual home: $ACTUAL_HOME"
else
  # Running in other shells (bash, etc.)
  ACTUAL_HOME="$HOME"
  echo "Using standard HOME: $ACTUAL_HOME"
fi

# Set the session root directory
session_root "$ACTUAL_HOME/project/perso/liftarchives-client/src"
echo "Session root set to: $session_root"

# Create session with specified name if it does not already exist
if initialize_session "liftarchives-client"; then

  # Create the app window with a vertical split and horizontal panes on the right
  new_window "code"
  run_cmd "cd $session_root && clear && nvim ."

  # Create git window with lazygit
  new_window "git"
  run_cmd "lazygit"

  # Create logs window (blank)
  new_window "logs"
  run_cmd "cd $session_root && clear"

  new_window "server"
  run_cmd "npm run dev"

  # Select the first window (app) when session starts
  select_window 1
fi

# Finalize session creation and switch/attach to it
finalize_and_go_to_session
