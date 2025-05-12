#!/bin/bash

# Set a custom session root path
OSX_HOME="/Users/rpcwt535"
if [ -n "$ZSH_VERSION" ]; then
  # Running in ZSH
  ACTUAL_HOME=$OSX_HOME
  echo "ZSH detected, using actual home: $ACTUAL_HOME"
else
  # Running in other shells (bash, etc.)
  ACTUAL_HOME="$HOME"
  echo "Using standard HOME: $ACTUAL_HOME"
fi

# Set the path to your webquote-ui project
session_root "$ACTUAL_HOME/Desktop/webquote-ui-"
echo "Session root set to: $session_root"
bundle_root "$ACTUAL_HOME/Desktop/webquote-ui-/apps/bundle"

# Create session with specified name
if initialize_session "webquote-ui"; then
  # Window 1: Code - for development with nvim
  new_window "code"
  run_cmd "cd $bundle_root && clear && nvim ."

  # Window 2: Git - for version control with lazygit
  new_window "git"
  run_cmd "cd $session_root && lazygit"

  # Window 3: Server - for running the development server
  new_window "server"
  split_h 80  # Split horizontally 50/50
  select_pane 1
  run_cmd "cd $session_root && clear && npm start"
  select_pane 2
  run_cmd "cd $session_root && clear"
  run_cmd "echo 'Server logs will appear in pane 1'" # You can customize this

  # Window 4: Cypress - for testing
  new_window "cypress"
  split_h 80  # Split horizontally 50/50
  select_pane 1
  run_cmd "cd $bundle_root && clear && npx cypress open"
  run_cmd "echo 'Ready to run Cypress tests'" # Or directly start with: npm run cypress:open
  select_pane 2
  run_cmd "cd $session_root && clear"
  run_cmd "echo 'Cypress test logs will appear here'"

  # Go back to the first window (code)
  select_window 1
fi

# Finalize session creation and switch/attach to it
finalize_and_go_to_session
