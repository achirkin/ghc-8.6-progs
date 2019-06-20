EXTRA_INSTALL_TOOLS = alex brittany c2hs cabal cpphs ghcid happy hindent hlint hoogle hpack HsColour stylish-haskell
EXTRA_INSTALL_TOOLS_DIR = utils/tools
EXTRA_INSTALL_TOOLS_BINDIST = $(addprefix "$(EXTRA_INSTALL_TOOLS_DIR)/", $(EXTRA_INSTALL_TOOLS) ghc.mk)
$(eval $(call bindist-list,$(EXTRA_INSTALL_TOOLS_DIR),$(EXTRA_INSTALL_TOOLS_BINDIST)))

install: install_utils/copy_tools

.PHONY: install_utils/copy_tools
install_utils/copy_tools:
	$(foreach i,$(EXTRA_INSTALL_TOOLS),$(CP) "$(EXTRA_INSTALL_TOOLS_DIR)/$i" "$(DESTDIR)$(bindir)/$i")
