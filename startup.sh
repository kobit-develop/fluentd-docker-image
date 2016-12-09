#!/bin/bash
set -e

if [[ $plugins ]]; then
gem install $plugins
fi

fluentd -c /fluentd/etc/$FLUENTD_CONF -p /fluentd/plugins $FLUENTD_OPT
