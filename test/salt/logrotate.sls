# -*- coding: utf-8 -*-
# vim: ft=yaml
---
logrotate:
  # default OS values can be overridden in 'lookup' dict
  # lookup:
  #   pkg: logrotate
  #   service: crond
  default_config:
    weekly: true
    rotate: 52
    create: true
    compress: true
    delaycompress: true
    dateext: true
    minsize: 10000
    maxsize: 1000000

  jobs:
    syslog:
      path:
        - /var/log/syslog
      config:
        - daily
        - rotate 30
        - compress
        - delaycompress
        - missingok
        - notifempty
        - sharedscripts
        - postrotate
        - /usr/lib/rsyslog/rsyslog-rotate
        - endscript
        - minsize 10000
        - maxsize 100000000
    rsyslog:
      path:
        - /var/log/cron
        - /var/log/maillog
        - /var/log/messages
        - /var/log/secure
        - /var/log/spooler
        - /var/log/slapd.log
        - /var/log/mail.info
        - /var/log/mail.warn
        - /var/log/mail.err
        - /var/log/mail.log
        - /var/log/daemon.log
        - /var/log/kern.log
        - /var/log/auth.log
        - /var/log/user.log
        - /var/log/lpr.log
        - /var/log/cron.log
        - /var/log/debug
      config:
        - weekly
        - rotate 52
        - compress
        - delaycompress
        - missingok
        - notifempty
        - sharedscripts
        - postrotate
        - /usr/lib/rsyslog/rsyslog-rotate
        - endscript
    dpkg:
      path:
        - /var/log/dpkg.log
        - /var/log/alternatives.log
      config:
        - weekly
        - rotate 52
        - compress
        - delaycompress
        - missingok
        - notifempty
        - create 644 root root
        - sharedscripts
    apt:
      path:
        - /var/log/apt/*.log
      config:
        - weekly
        - rotate 52
        - compress
        - delaycompress
        - missingok
        - notifempty
        - create 644 root root
        - sharedscripts
