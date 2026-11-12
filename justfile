[private]
default:
	@just --list

# System bauen und neue Config hochladen mit Commit Message "Updated: 2019-08-28 10:22:06"
update-push:
	git add .
	git commit -m "Updated: `date +'%Y-%m-%d %H:%M:%S'`"
	sudo nixos-rebuild switch --flake .
	git push

# Neue Config runterladen und System bauen
pull-update:
	git fetch
	git pull
	sudo nixos-rebuild switch --flake .
	
push:
	git add .
	git commit -m "Updated: `date +'%Y-%m-%d %H:%M:%S'`"
	git push
