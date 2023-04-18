CURRNET_DIR := $(shell pwd)

# Hugo
HUGO_VER := 0.101.0
HUGO_IMG := klakegg/hugo:$(HUGO_VER)
HUGO_CMD := docker run --rm -it \
	-v $(CURRNET_DIR):/src \
	$(HUGO_IMG)

build:
	$(HUGO_CMD)
serve_local:
	docker run --rm -it \
	-p 1313:1313 \
	-v $(CURRNET_DIR):/src \
	$(HUGO_IMG) server -D

post:
	@yyyymmdd="$$(date +%Y%m%d)"; \
	$(HUGO_CMD) new blog/$${year}/$${month}/$${yyyymmdd}.md
