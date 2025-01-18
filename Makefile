PLIST = com.github.mvp.mac-remap-keys.plist
DEST = $(HOME)/Library/LaunchAgents/$(PLIST)

all: install

install:
	install -m 644 $(PLIST) $(DEST)
	$(info ┌──────────────────────────────────────────────────────────┐)
	$(info │ Make sure that `hidutil` is enabled in Input Monitoring! │)
	$(info └──────────────────────────────────────────────────────────┘)

uninstall:
	rm $(DEST)
