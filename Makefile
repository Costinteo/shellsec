# Inspired by https://github.com/dylanaraps/neofetch

INSTALL_DIR = /usr/local/bin
SHELL = /usr/bin/env sh

all:
	@echo Run \'make install\' to install shellsec.
	@echo For custom installation directory, use \'make INSTALL_DIR=...\'
	@echo Current installation directory is \'$(INSTALL_DIR)\'.

install:
	@echo Making directory $(INSTALL_DIR)...
	@mkdir -p $(INSTALL_DIR)
	@echo Copying files to it...
	@cp shellsec $(INSTALL_DIR)/
	@cp shellsec-setkey $(INSTALL_DIR)/
	@echo Making scripts executable...
	@chmod 755 $(INSTALL_DIR)/shellsec
	@chmod 755 $(INSTALL_DIR)/shellsec-setkey

uninstall:
	@echo Deleting shellsec from $(INSTALL_DIR)...
	@rm $(INSTALL_DIR)/shellsec
	@rm $(INSTALL_DIR)/shellsec-setkey
	@if [ -z "$(ls -A $INSTALL_DIR)" ]; then \
		rmdir $(INSTALL_DIR); echo Directory $(INSTALL_DIR) empty, deleting...; \
		fi
