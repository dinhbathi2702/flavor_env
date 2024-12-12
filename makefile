FLUTTER ?= fvm flutter

.PHONY: init
init:
	bash script/appendGitEnvs.sh
	git submodule update --init
	git submodule update --recursive --remote
	$(FLUTTER) pub get	
	$(FLUTTER) pub run build_runner build --delete-conflicting-outputs