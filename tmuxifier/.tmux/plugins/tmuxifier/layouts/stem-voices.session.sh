#!/bin/bash

# Set a custom session root path for macOS
OSX_HOME="/Users/julienc."

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
session_root "$ACTUAL_HOME/project/work/EDUQlasse-STEM-Voix-Voices/"
echo "Session root set to: $session_root"

# Create session with specified name if it does not already exist
if initialize_session "stem-voices"; then
  # Create the app window with a vertical split and horizontal panes on the right
  new_window "app"

  # Create a vertical split with the right pane taking up 1/3 of the window
  split_h 33

  # In the right pane, create 3 horizontal splits
  run_cmd "cd $session_root && clear" "$pane"
  split_v 66
  run_cmd "cd $session_root && clear" "$pane"
  split_v 50
  run_cmd "cd $session_root && clear" "$pane"

  # Configure the panes to run the specified commands
  select_pane 2
  run_cmd "npm run dev"
  select_pane 3
  run_cmd "npm run db:studio"
  select_pane 4
  run_cmd "clear"

  # Go back to the main left pane and open neovim
  select_pane 1
  run_cmd "nvim ./src/"

  # Create git window with lazygit
  new_window "git"
  run_cmd "lazygit"

  # Create logs window (blank)
  new_window "logs"
  run_cmd "cd $session_root && clear"

  # Select the first window (app) when session starts
  select_window 1
fi

# Finalize session creation and switch/attach to it
finalize_and_go_to_session
