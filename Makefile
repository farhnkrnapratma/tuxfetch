.PHONY: all install update uninstall clean-install clean-update clean-uninstall

APP_NAME     ?= tuxfetch
APP_CONFIG   ?= init
BIN          ?= /usr/bin
DESTDIR      ?=
SUDO         ?= sudo
INSTALL      ?= install

INSTALL_PATH = $(DESTDIR)$(BIN)/$(APP_NAME)

all:
	@echo "Run 'make install' to install $(APP_NAME)."

_do_config:
	@USER_HOME=$$(eval echo ~$${SUDO_USER:-$$USER}); \
	CONFIG_PATH="$$USER_HOME/.config/$(APP_NAME)"; \
	$(INSTALL) -Dm 644 "$(APP_CONFIG)" "$$CONFIG_PATH/$(APP_CONFIG)"

_do_install: _do_config
	$(SUDO) $(INSTALL) -Dm 755 "$(APP_NAME)" "$(INSTALL_PATH)"

_install: _do_install

_uninstall:
	$(SUDO) rm -f "$(INSTALL_PATH)"

_clean_uninstall: _uninstall
	@CONFIG_PATH="$$(eval echo ~$${SUDO_USER:-$$USER})/.config/$(APP_NAME)"; \
	rm -rf "$$CONFIG_PATH"

_clean_update_install: _clean_uninstall _install

install: _install
	@echo "Done"

update:
	$(SUDO) rm -f "$(INSTALL_PATH)"
	$(MAKE) _install --no-print-directory
	@echo "Done"

uninstall: _uninstall
	@echo "Done"

clean-uninstall: _clean_uninstall
	@echo "Done"

clean-update: _clean_update_install
	@echo "Done"

clean-install: _clean_update_install
	@echo "Done"
