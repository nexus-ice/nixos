[private]
default:
	@just --list

# Build System
update-push:
	git add .
	git commit -m "Updated: `date +'%Y-%m-%d %H:%M:%S'`" # Updated: 2019-08-28 10:22:06
	sudo nixos-rebuild switch --flake .

# add new files from git
pull-update:
	git fetch
	git pull
	sudo nixos-rebuild switch --flake .
