.DEFAULT_GOAL := help

STOW := stow
TARGET := $(HOME)
PACKAGES := zsh

.PHONY: help install uninstall restow check

help:
	@echo "Available commands:"
	@echo "  make install    Create dotfiles symlinks"
	@echo "  make uninstall  Remove managed symlinks"
	@echo "  make restow     Refresh managed symlinks"
	@echo "  make check      Preview Stow operations"

install:
	$(STOW) -t "$(TARGET)" $(PACKAGES)

uninstall:
	$(STOW) -D -t "$(TARGET)" $(PACKAGES)

restow:
	$(STOW) -R -t "$(TARGET)" $(PACKAGES)

check:
	$(STOW) -n -v -t "$(TARGET)" $(PACKAGES)
