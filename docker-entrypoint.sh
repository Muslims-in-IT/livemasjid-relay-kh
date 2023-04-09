#!/bin/sh

if [ -n "$ICECAST_SOURCE_PASSWORD" ]; then
    sed -i "s/<source-password>[^<]*<\/source-password>/<source-password>$ICECAST_SOURCE_PASSWORD<\/source-password>/g" /etc/icecast.xml
fi
if [ -n "$ICECAST_RELAY_PASSWORD" ]; then
    sed -i "s/<relay-password>[^<]*<\/relay-password>/<relay-password>$ICECAST_RELAY_PASSWORD<\/relay-password>/g" /etc/icecast.xml
fi
if [ -n "$ICECAST_ADMIN_PASSWORD" ]; then
    sed -i "s/<admin-password>[^<]*<\/admin-password>/<admin-password>$ICECAST_ADMIN_PASSWORD<\/admin-password>/g" /etc/icecast.xml
fi
if [ -n "$ICECAST_ADMIN_USERNAME" ]; then
    sed -i "s/<admin-user>[^<]*<\/admin-user>/<admin-user>$ICECAST_ADMIN_USERNAME<\/admin-user>/g" /etc/icecast.xml
fi
if [ -n "$ICECAST_ADMIN_EMAIL" ]; then
    sed -i "s/<admin>[^<]*<\/admin>/<admin>$ICECAST_ADMIN_EMAIL<\/admin>/g" /etc/icecast.xml
fi
if [ -n "$ICECAST_LOCATION" ]; then
    sed -i "s/<location>[^<]*<\/location>/<location>$ICECAST_LOCATION<\/location>/g" /etc/icecast.xml
fi
if [ -n "$ICECAST_HOSTNAME" ]; then
    sed -i "s/<hostname>[^<]*<\/hostname>/<hostname>$ICECAST_HOSTNAME<\/hostname>/g" /etc/icecast.xml
fi
if [ -n "$ICECAST_MAX_CLIENTS" ]; then
    sed -i "s/<clients>[^<]*<\/clients>/<clients>$ICECAST_MAX_CLIENTS<\/clients>/g" /etc/icecast.xml
fi
if [ -n "$ICECAST_MAX_SOURCES" ]; then
    sed -i "s/<sources>[^<]*<\/sources>/<sources>$ICECAST_MAX_SOURCES<\/sources>/g" /etc/icecast.xml
fi
if [ -n "$LOG_LEVEL" ]; then
    sed -i "s/<loglevel>[^<]*<\/loglevel>/<loglevel>$LOG_LEVEL<\/loglevel>/g" /etc/icecast.xml
fi
# Set error-log and access-log to $ERROR_LOG and $ACCESS_LOG
if [ -n "$ERROR_LOG" ]; then
    sed -i "s/<errorlog>[^<]*<\/errorlog>/<errorlog>$ERROR_LOG<\/errorlog>/g" /etc/icecast.xml
fi
if [ -n "$ACCESS_LOG" ]; then
    sed -i "s/<accesslog>[^<]*<\/accesslog>/<accesslog>$ACCESS_LOG<\/accesslog>/g" /etc/icecast.xml
fi

# Add config to icecast.xml before the end of the file and before the </icecast> tag

if [ -n "$MASTER_SERVER" ]; then
    sed -i "s/<!--<master-server>/<master-server>$MASTER_SERVER<\/master-server>\n<!--<master-server>/g" /etc/icecast.xml
fi
if [ -n "$MASTER_SERVER_PORT" ]; then
    sed -i "s/<!--<master-server>/<master-server-port>$MASTER_SERVER_PORT<\/master-server-port>\n<!--<master-server>/g" /etc/icecast.xml
fi
if [ -n "$MASTER_UPDATE_INTERVAL" ]; then
    sed -i "s/<!--<master-server>/<master-update-interval>$MASTER_UPDATE_INTERVAL<\/master-update-interval>\n<!--<master-server>/g" /etc/icecast.xml
fi
if [ -n "$MASTER_PASSWORD" ]; then
    sed -i "s/<!--<master-server>/<master-password>$MASTER_PASSWORD<\/master-password>\n<!--<master-server>/g" /etc/icecast.xml
fi
if [ -n "$RELAYS_ON_DEMAND" ]; then
    sed -i "s/<!--<master-server>/<relays-on-demand>$RELAYS_ON_DEMAND<\/relays-on-demand>\n<!--<master-server>/g" /etc/icecast.xml
fi

exec "$@"
