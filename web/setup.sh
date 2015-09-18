#!/bin/bash
#
# Setup environment for running test finds.org.uk server.

set -xe

ROOT="/var/www/findsorguk"
PUB_HTML="${ROOT}/public_html"

function ensure_dir() {
	_dir="$1"
	if [ ! -d "${_dir}" ]; then
		mkdir -p "${_dir}"
	fi
	chown -R www-data:www-data "${_dir}"
}

ensure_dir "${PUB_HTML}/images"
ensure_dir "${ROOT}/app/logs/"
ensure_dir "${ROOT}/solr"
ensure_dir "${ROOT}/cache"

a2ensite findsorguk
a2dissite 000-default
a2enmod rewrite headers expires php5 

