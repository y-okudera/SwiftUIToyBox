# Variables

## xcodeproj filename
project_name=SwiftUIToyBox

# Targets

.PHONY: help
help: ## Show this usage
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

.PHONY: xcode
xcode: ## Select latest version of Xcode
	sudo xcode-select --switch /Applications/Xcode.app/

.PHONY: bootstrap
bootstrap: ## Install ruby tools
	brew update
	brew install mint
	mint bootstrap
	bundle --path vendor/bundle --binstubs=vendor/bin
	bundle install --path=vendor/bundle

.PHONY: project
project: ## Generate Xcode project and workspace
	mint run SwiftGen swiftgen
	mint run XcodeGen xcodegen
	# bundle exec pod install
	# mint run Carthage carthage bootstrap --platform iOS --cache-builds
	# echo mint run Carthage carthage update --platform iOS --cache-builds [dependencies...]

.PHONY: open
open: ## Open Xcode project
	open $(project_name).xcodeproj

.PHONY: clean
clean: ## Clean generated files
	rm -rf $(project_name).xcodeproj
	rm -rf $(project_name).xcworkspace
	rm -rf $(project_name)/Presentaion/Asset/Generated/*
	rm -rf $(project_name)/Application/Generated/*
	echo rm -rf Carthage
	echo rm -rf Pods

.PHONY: update
update: ## Update tool versions
	brew update
	brew upgrade
	bundle update
	mint bootstrap
	# bundle exec pod install
	# mint run Carthage carthage update --platform iOS
