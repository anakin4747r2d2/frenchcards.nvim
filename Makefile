NVIM     ?= nvim
PLENARY  ?= $(HOME)/.local/share/nvim/site/pack/vendor/start/plenary.nvim

.PHONY: test install-plenary

## Run the test suite (requires plenary.nvim)
test:
	$(NVIM) --headless \
	  -u tests/minimal_init.lua \
	  -c "lua require('plenary.test_harness').test_directory('tests/', { minimal_init = 'tests/minimal_init.lua' })"

## Clone plenary.nvim into the default vendor path (one-time setup)
install-plenary:
	@mkdir -p $(dir $(PLENARY))
	@if [ ! -d "$(PLENARY)" ]; then \
	  git clone --depth 1 https://github.com/nvim-lua/plenary.nvim $(PLENARY); \
	else \
	  echo "plenary.nvim already installed at $(PLENARY)"; \
	fi
