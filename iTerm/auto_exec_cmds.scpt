-- Generic iTerm task executor
--
-- Usage: Modifies the three variables the the one you like :)
--
-- Variables:
--
--    session_name: the name of the session(or tab, equivalently) that
--				 you would like to give for this task.
--
--    exec_path: the path where you would like to execute the commands.
--
--    commands: to commands to be executed.
--
-- Example for multiple commands in one line: grunt clean;grunt build; node server;

set session_name to "grunt"
set exec_path to "~/Projects/imagys"
set commands to "grunt"

tell application "iTerm"
	tell the current terminal
		repeat with s in sessions
			tell s
				set s_name to get name
				if s_name contains session_name then
					write text commands
					return
				end if
			end tell
		end repeat
		
		launch session "Default Session"
		tell the last session
			set name to session_name
			write text "cd " & exec_path & "; " & commands
		end tell
		
	end tell
end tell
