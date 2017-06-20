#!/bin/bash

pandoc -s -S -H DedeLambCV.css DedeLambCV.md -o DedeLambCV.html
wkhtmltopdf -T 25mm -L 25mm -R 25mm -B 25mm DedeLambCV.html DedeLambCV.pdf
