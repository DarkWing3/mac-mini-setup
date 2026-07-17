RUBY_PATH := /opt/homebrew/opt/ruby/bin
BUNDLE    := PATH="$(RUBY_PATH):$$PATH" bundle

.PHONY: install serve build clean

install: ## Install Jekyll gems into docs/vendor/bundle
	cd docs && $(BUNDLE) config set --local path 'vendor/bundle' && $(BUNDLE) install

serve: ## Run the local preview server at http://127.0.0.1:4000/mac-mini-setup/
	cd docs && $(BUNDLE) exec jekyll serve

build: ## Build the static site into docs/_site
	cd docs && $(BUNDLE) exec jekyll build

clean: ## Remove generated build artifacts
	rm -rf docs/_site docs/.jekyll-cache
