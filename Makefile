GOBUILD=go build -trimpath -ldflags '-w -s'  -o
BIN=bin/dmm-scraper
BIN2=bin/dmm-scraper.exe
SOURCE=.
VERSION=1.4.0

docker:
	$(GOBUILD) $(BIN) $(SOURCE)
mac:
	GOOS=darwin GOARCH=amd64 $(GOBUILD) $(BIN) $(SOURCE)
	cp config.toml bin/
	zip bin/dmm-scraper-darwin-amd64-v$(VERSION).zip $(BIN) bin/config.toml
win:
	GOOS=windows GOARCH=amd64 $(GOBUILD) $(BIN2) $(SOURCE)
	cp config.toml bin/
	zip bin/dmm-scraper-windows-amd64-v$(VERSION).zip $(BIN2) bin/config.toml
m1:
	GOOS=darwin GOARCH=arm64 $(GOBUILD) $(BIN) $(SOURCE)
	cp config.toml bin/
	zip bin/dmm-scraper-darwin-arm64-v$(VERSION).zip $(BIN) bin/config.toml
pi:
	GOOS=linux GOARCH=arm64 $(GOBUILD) $(BIN) $(SOURCE)
	cp config.toml bin/
	zip bin/dmm-scraper-linux-arm64-v$(VERSION).zip $(BIN) bin/config.toml
nas:
	GOOS=linux GOARCH=amd64 $(GOBUILD) $(BIN) $(SOURCE)
	cp config.toml bin/
	zip bin/dmm-scraper-linux-amd64-v$(VERSION).zip $(BIN) bin/config.toml
