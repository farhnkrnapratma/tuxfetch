APP_NAME    ?= tuxfetch
APP_CONFIG  ?= init
BIN         ?= /usr/bin
DESTDIR     ?=
SUDO        ?= sudo
INSTALL     ?= install

INSTALL_PATH = $(DESTDIR)$(BIN)/$(APP_NAME)
USER_HOME    := $(shell eval echo ~$${SUDO_USER:-$$USER})
CONFIG_PATH  = $(USER_HOME)/.config/$(APP_NAME)

_install:
	$(INSTALL) -Dm 644 $(APP_CONFIG) $(CONFIG_PATH)/$(APP_CONFIG)
	$(SUDO) $(INSTALL) -Dm 755 $(APP_NAME) $(INSTALL_PATH)

_clean:
	$(SUDO) rm -f $(INSTALL_PATH)
	rm -rf $(CONFIG_PATH)

install: _install
	@echo "Installation complete."

update:
	$(SUDO) rm -f $(INSTALL_PATH)
	$(SUDO) $(INSTALL) -Dm 755 $(APP_NAME) $(INSTALL_PATH)
	@echo "Update complete."

clean-update: _clean _install
	@echo "Clean update complete."

uninstall:
	$(SUDO) rm -f $(INSTALL_PATH)
	@echo "Uninstallation complete."

clean-uninstall: _clean
	@echo "Clean uninstallation complete."

.PHONY: install update clean-update uninstall clean-uninstall
