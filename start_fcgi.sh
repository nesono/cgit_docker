#!/bin/sh
# Taken from https://www.nginx.com/resources/wiki/start/topics/examples/freebsdspawnfcgi/
# modified for simple starting only in a Docker container

set -o errexit -o nounset

# Modified spawn-fcgi for rc.d (original: vivek@nixcraft.com
readonly SPAWNFCGI=/usr/bin/spawn-fcgi
readonly FCGI_CHILDREN=3
readonly SERVER_SOCKET=/tmp/fcgi.socket
readonly SERVER_PID=/tmp/fcgi.pid
readonly SERVER_USER=www-data
readonly SERVER_GROUP=www-data
readonly FCGI_PROCESS=/usr/bin/php-cgi

fcgi_start()
{
    $SPAWNFCGI -s $SERVER_SOCKET -P $SERVER_PID -u $SERVER_USER -g $SERVER_GROUP -F $FCGI_CHILDREN -f $FCGI_PROCESS
}

fcgi_start
