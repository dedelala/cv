from alpine:edge

run apk --no-cache add ttf-freefont pandoc weasyprint

copy mkdocs.sh /usr/bin/mkdocs.sh
copy style.css /root/style.css

run mkdir /doc
workdir /doc
entrypoint ["/usr/bin/mkdocs.sh"]
