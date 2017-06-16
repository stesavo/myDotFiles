#!/bin/bash
sudo tail -F /var/log/apache2/error.log | grep -v --line-buffered 'proxy: ' | sed -u s/^........................................................//g | sed -u s/..referer:.*$//g


