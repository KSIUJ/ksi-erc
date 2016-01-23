#!/bin/bash
bundle exec rake erd
convert erd.pdf erd.png
pandoc doc_pl.md -s -o doc_pl.html
pandoc doc_pl.html -s -o doc_pl.pdf
rm doc_pl.html erd.png
