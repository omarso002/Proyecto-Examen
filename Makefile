VERSION: = latest
FILENAME: = vscode.deb
URL: = https://github.com/microsoft/vscode/releases/download/$(VERSION)/code_$(VERSION)_amd64.deb
INSTALL_PATH: = /usr/share/code
REMOVE_PATH: = /usr/share/code
ICON_PATH: = /usr/share/pixmaps/code.png
ICON_URL: = https://raw.githubusercontent.com/microsoft/vscode/main/resources/linux/code.png


all: install

install:
	wget -O $(FILENAME) $(URL)
	sudo apt install ./$(FILENAME) -y
	rm -f $(FILENAME)
	sudo cp -f $(ICON_PATH) $(ICON_PATH).bak
	sudo wget -O $(ICON_PATH) $(ICON_URL)

update:
	wget -O $(FILENAME) $(URL)
	sudo apt install ./$(FILENAME) -y
	rm -f $(FILENAME)

uninstall remove:
	sudo apt remove code -y
	sudo rm -rf $(REMOVE_PATH)
	sudo rm -f $(ICON_PATH)
	sudo mv -f $(ICON_PATH).bak $(ICON_PATH)

clean:
	rm -f $(FILENAME)

delete:
	rm -f $(FILENAME)
	sudo rm -rf $(REMOVE_PATH)
	sudo rm -f $(ICON_PATH)
	sudo mv -f $(ICON_PATH).bak $(ICON_PATH)
