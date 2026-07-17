RUBY_PATH := /opt/homebrew/opt/ruby/bin
BUNDLE    := PATH="$(RUBY_PATH):$$PATH" bundle
PORT      := 4000

.PHONY: install serve stop build clean

install: ## Install Jekyll gems into docs/vendor/bundle
	cd docs && $(BUNDLE) config set --local path 'vendor/bundle' && $(BUNDLE) install

serve: ## Run the local preview server at http://127.0.0.1:4000/mac-mini-setup/
	cd docs && $(BUNDLE) exec jekyll serve

stop: ## Stop the local preview server (kills whatever is listening on $(PORT))
	@lsof -ti tcp:$(PORT) | xargs kill -TERM 2>/dev/null || echo "Nothing listening on port $(PORT)"

build: ## Build the static site into docs/_site
	cd docs && $(BUNDLE) exec jekyll build

clean: ## Remove generated build artifacts
	rm -rf docs/_site docs/.jekyll-cache
