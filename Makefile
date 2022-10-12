# Inspired by https://github.com/dylanaraps/neofetch

INSTALL_DIR = /usr/local/bin
SHELL = /usr/bin/env sh

all:
	@echo Run \'make install\' to install shellsec.
	@echo Run \'make uninstall\' to uninstall shellsec.
	@echo Run \'make complete\' to add bash auto completion to your .bashrc.
	@echo For custom installation directory, use \'make INSTALL_DIR=...\'.
	@echo Current installation directory is \'$(INSTALL_DIR)\'.

install:
	@echo Making directory $(INSTALL_DIR)...
	@mkdir -p $(INSTALL_DIR)
	@echo Copying files to it...
	@cp shellsec $(INSTALL_DIR)/
	@cp shellsec-setkey $(INSTALL_DIR)/
	@cp shellsec-complete $(INSTALL_DIR)/
	@echo Making scripts executable...
	@chmod 755 $(INSTALL_DIR)/shellsec
	@chmod 755 $(INSTALL_DIR)/shellsec-setkey
	@chmod 755 $(INSTALL_DIR)/shellsec-complete

uninstall:
	@echo Deleting shellsec from $(INSTALL_DIR)...
	@rm $(INSTALL_DIR)/shellsec
	@rm $(INSTALL_DIR)/shellsec-setkey
	@rm $(INSTALL_DIR)/shellsec-complete
	@if [ -z "$(ls -A $INSTALL_DIR)" ]; then \
		rmdir $(INSTALL_DIR); echo Directory $(INSTALL_DIR) empty, deleting...; \
		fi

# inject bash auto completion for shellsec
complete:
	@if [ -z "$(shell grep 'shellsec-complete' $(HOME)/.bashrc)" ]; then \
		echo "\n# Added by shellsec" >> $(HOME)/.bashrc && echo ". $(shell command -v shellsec-complete)" >> $(HOME)/.bashrc; \
		echo "Injected bash completion in your .bashrc at $(HOME)/.bashrc"; \
	else \
		echo "Bash completion is already injected in your .bashrc"; \
	fi
