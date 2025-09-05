#!/bin/sh
gomplate < /etc/nginx/nginx.conf.template > /etc/nginx/nginx.conf
nginx-debug -g 'daemon off;'