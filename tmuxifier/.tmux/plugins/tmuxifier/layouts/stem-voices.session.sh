# Set a custom session root path to the current directory where the script is run
  session_root "$HOME/project/work/EDUQlasse-STEM-Voix-Voices/"

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
  select_pane 1
  run_cmd "npm run dev"

  select_pane 2
  run_cmd "npm run db:studio"

  select_pane 3
  run_cmd "clear"

  # Go back to the main left pane and open neovim
  select_pane 0

  run_cmd "nvim ./src/"

  # Create git window with lazygit
  new_window "git"
  run_cmd "lazygit"

  # Create logs window (blank)
  new_window "logs"
  run_cmd "cd $session_root && clear"

  # Select the first window (app) when session starts
  select_window 0
fi

# Finalize session creation and switch/attach to it
finalize_and_go_to_session
