#!/bin/bash
pandoc doc_pl.md -s -o doc_pl.html
pandoc doc_pl.html -s -o doc_pl.pdf
rm doc_pl.html
