APP=tuxfetch
BIN = /usr/bin

all:
	@echo Run \'make install\' to install Tuxfetch.

install:
	@sudo mkdir -p $(DESTDIR)$(BIN)
	@sudo cp -p $(APP) $(DESTDIR)$(BIN)/$(APP)
	@sudo chmod 755 $(DESTDIR)$(BIN)/$(APP)
	@echo Done 

uninstall:
	@sudo rm -rf $(DESTDIR)$(BIN)/$(APP)
	@rm -rf ~/.config/$(APP)
	@echo Done

update:
	@sudo rm -rf $(DESTDIR)$(BIN)/$(APP)
	@sudo cp -p $(APP) $(DESTDIR)$(BIN)/$(APP)
	@sudo chmod 755 $(DESTDIR)$(BIN)/$(APP)
	@echo Done

clean-update:
	@sudo rm -rf $(DESTDIR)$(BIN)/$(APP)
	@rm -rf ~/.config/$(APP)
	@sudo cp -p $(APP) $(DESTDIR)$(BIN)/$(APP)
	@sudo chmod 755 $(DESTDIR)$(BIN)/$(APP)
	@echo Done