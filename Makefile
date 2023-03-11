VERSION = $(shell curl -s "https://api.github.com/repos/microsoft/vscode/releases/latest" | grep '"tag_name":' | sed -E 's/."([^"]+)"./\1/')
DOWNLOAD_URL = https://update.code.visualstudio.com/$(VERSION)/linux-deb-x64/stable


install:
	curl -L $(DOWNLOAD_URL) -o vscode.deb
	sudo dpkg -i vscode.deb
	rm vscode.deb

update:

	VERSION_NEW=$$(curl -s "https://api.github.com/repos/microsoft/vscode/releases/latest" | grep '"tag_name":' | sed -E 's/."([^"]+)"./\1/')
	$(MAKE) clean;
	$(MAKE) install;

uninstall:
	sudo dpkg -r code

clean:
	rm -f vscode.deb

delete:
	rm -rf /usr/share/code
