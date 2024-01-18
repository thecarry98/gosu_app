.PHONY: all run_dev_web run_dev run_unit clean upgrade lint format build_dev help watch gen run_stag run_prod build_stag build_prod purge build_runner

all: lint format run_dev_mobile

#frequently use

build_runner:
	@echo "╠ Building the project..."
	@flutter packages pub run build_runner build --delete-conflicting-outputs

# pod_install:
# 	@cd ios
# 	@pod deintegrate
# 	@pod install
# 	@cd ..

clean: 
	@echo "Cleaning..."
	@flutter clean
	
get:
	@rm pubspec.lock
	@flutter pub get

cache_clean:
	@echo "╠ Removing cache..."
	@flutter pub cache clean
	@make clean
	@make get

run_dev: ## Runs the mobile application in dev
	@echo "╠ Running the app in dev environment"
	@flutter run --flavor dev --target lib/main_dev.dart

run_stag: ## Runs the mobile application in staging
	@echo "╠ Running the app in staging environment"
	@flutter run --flavor staging --target lib/main_stag.dart

run_prod: ## Runs the mobile application in producion
	@echo "╠ Running the app in production environment"
	@flutter run --flavor production --target lib/main_prod.dart

build_ios_prod: 
	@flutter build ios --flavor production --target lib/main_prod.dart

build_dev: ## Build apk in the mobile application in dev
	@echo "╠ Building the app in dev environment"
	@flutter build apk --flavor dev --target lib/main_dev.dart

build_stag: ## Build apk the mobile application in staging
	@echo "╠ Building the app in stag environment"
	@flutter build apk --flavor staging --target lib/main_stag.dart

build_prod: ## Build apk in the mobile application in production
	@echo "╠ Building the app in production environment"
	@flutter build apk --flavor production --target lib/main_prod.dart

# Adding a help file: https://gist.github.com/prwhite/8168133#gistcomment-1313022
help: ## This help dialog.
	@IFS=$$'\n' ; \
	help_lines=(`fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//'`); \
	for help_line in $${help_lines[@]}; do \
		IFS=$$'#' ; \
		help_split=($$help_line) ; \
		help_command=`echo $${help_split[0]} | sed -e 's/^ *//' -e 's/ *$$//'` ; \
		help_info=`echo $${help_split[2]} | sed -e 's/^ *//' -e 's/ *$$//'` ; \
		printf "%-30s %s\n" $$help_command $$help_info ; \
	done

run_unit: ## Runs unit tests
	@echo "╠ Running the tests..."
	@flutter test || (echo "Error while running tests"; exit 1)

watch: ## Watches the files for changes
	@echo "╠ Watching the project..."
	@flutter pub run build_runner watch --delete-conflicting-outputs

build: ## Build the files for changes
	@echo "╠ Building the project..."
	@flutter pub run build_runner build --delete-conflicting-outputs


gen: ## Generates the assets
	@echo "╠ Generating the assets..."
	@flutter pub get
	@flutter packages pub run build_runner build

format: ## Formats the code
	@echo "╠ Formatting the code..."
	@dart format lib .
	@flutter pub run import_sorter:main
	@flutter format lib

lint: ## Lints the code
	@echo "╠ Verifying code..."
	@dart analyze . || (echo "Error in project"; exit 1)

upgrade: clean ## Upgrades dependencies
	@echo "╠ Upgrading dependencies..."
	@flutter pub upgrade

commit: format lint run_unit
	@echo "╠ Committing..."
	git add .
	git commit

run_dev_web: ## Runs the web application in dev
	@echo "╠ Running the app..."
	@flutter run -d chrome --dart-define=ENVIRONMENT=dev

purge: ## Purges the Flutter
	@pod deinteg.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            rate
	@flutter clean
	@flutter pub get
