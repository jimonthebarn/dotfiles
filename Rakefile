# 	 ███████             ██               ████ ██  ██
# 	░██░░░░██           ░██              ░██░ ░░  ░██
# 	░██   ░██   ██████  ░██  ██  █████  ██████ ██ ░██  █████
# 	░███████   ░░░░░░██ ░██ ██  ██░░░██░░░██░ ░██ ░██ ██░░░██
# 	░██░░░██    ███████ ░████  ░███████  ░██  ░██ ░██░███████
# 	░██  ░░██  ██░░░░██ ░██░██ ░██░░░░   ░██  ░██ ░██░██░░░░
# 	░██   ░░██░░████████░██░░██░░██████  ░██  ░██ ███░░██████
# 	░░     ░░  ░░░░░░░░ ░░  ░░  ░░░░░░   ░░   ░░ ░░░  ░░░░░░

require 'rake'
require 'fileutils'
require 'os'

# These are all the files we want to symlink to ~
# key is the name of the symlink, value the actual file name
FILES = {
		".oh-my-zsh" => ".oh-my-zsh",
		".gitconfig" => ".gitconfig",
		".gitignore" => ".gitignore",
		".maid" => ".maid",
		".p10k.zsh" => ".p10k.zsh"
}

task :default => 'install'

desc "Hook our dotfiles into system-standard positions."
task :install do

  # Enable linking of different files per platform
	if OS.mac?
		puts "This is a mac"
		FILES[".zshrc"] = "osx/.zshrc"
  end

  if OS.linux?
		puts "This is a linux"
		FILES[".zshrc"] = "debian/.zshrc"
  end
  # if OS.windows?
	# 	puts "This is a windows"
  # end
  # if OS.java?
	# 	puts "This is a java"
  # end

	FILES.each do |symlinkFileName, actualFileName|
		symlink_file( symlinkFileName, actualFileName )
	end
end

def symlink_file( symlinkFileName, actualFileName )
	source = "#{ENV["PWD"]}/#{actualFileName}"
	target = "#{ENV["HOME"]}/#{symlinkFileName}"

	puts "Source: #{source}"
	puts "Target: #{target}"

	if File.exists?(target) || File.symlink?(target)
		puts "[Overwriting] #{target}..."
	end

	`ln -nfs "#{source}" "#{target}"`

end
