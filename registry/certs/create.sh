#!/bin/sh
cd "${0%/*}"

openssl req -newkey rsa:4096 -nodes -sha256 -keyout domain.key -x509 -days 365 -out domain.crt
