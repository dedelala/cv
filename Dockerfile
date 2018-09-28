from alpine:edge as getter

run apk --no-cache add curl tar

workdir /root

run curl -fsSLo pandoc.tar.gz https://github.com/jgm/pandoc/releases/download/2.3/pandoc-2.3-linux.tar.gz

run tar xvzf pandoc.tar.gz


from alpine:edge

run apk --no-cache --allow-untrusted --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ add wkhtmltopdf
run apk --no-cache add ttf-freefont

copy --from=getter /root/pandoc-*/bin/pandoc /usr/bin/pandoc
copy mkdocs.sh /usr/bin/mkdocs.sh
copy style.css /root/style.css

run mkdir /doc
workdir /doc
entrypoint ["/usr/bin/mkdocs.sh"]
