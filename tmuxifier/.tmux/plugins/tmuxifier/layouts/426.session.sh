session_root "~/project/school/concordia/COMP-426/A1_40314968/"
# Create session with specified name if it does not already exist. If no
# argument is given, session name will be based on layout file name.
if initialize_session "gol"; then
  new_window "code"
  run_cmd "cd $session_root && clear && vi ."

  new_window "lazygit"
  run_cmd "cd $session_root && clear && lazygit"

  select_window 1

fi
# Finalize session creation and switch/attach to it.
finalize_and_go_to_session
