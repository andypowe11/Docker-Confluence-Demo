FROM andypowe11:ubuntu-java8

# File Author / Maintainer
MAINTAINER Andy Powell <andy@andypowe11.net>

# Configuration variables.
ENV CONF_HOME     /var/local/atlassian/confluence
ENV CONF_INSTALL  /usr/local/atlassian/confluence
ENV CONF_VERSION  5.10.7

ARG environment=local

# Install Atlassian Confluence and helper tools and setup initial home
# directory structure.
RUN set -x \
    && apt-get update --quiet \
    && apt-get install --quiet --yes --no-install-recommends libtcnative-1 xmlstarlet \
    && apt-get clean \
    && mkdir -p                "${CONF_HOME}" \
    && chmod -R 700            "${CONF_HOME}" \
    && chown daemon:daemon     "${CONF_HOME}" \
    && mkdir -p                "${CONF_INSTALL}/conf" \
    && curl -Ls                "http://www.atlassian.com/software/confluence/downloads/binary/atlassian-confluence-${CONF_VERSION}.tar.gz" | tar -xz --directory "${CONF_INSTALL}" --strip-components=1 --no-same-owner \
    && chmod -R 700            "${CONF_INSTALL}/conf" \
    && chmod -R 700            "${CONF_INSTALL}/temp" \
    && chmod -R 700            "${CONF_INSTALL}/logs" \
    && chmod -R 700            "${CONF_INSTALL}/work" \
    && chown -R daemon:daemon  "${CONF_INSTALL}/conf" \
    && chown -R daemon:daemon  "${CONF_INSTALL}/temp" \
    && chown -R daemon:daemon  "${CONF_INSTALL}/logs" \
    && chown -R daemon:daemon  "${CONF_INSTALL}/work" \
    && echo -e                 "\nconfluence.home=$CONF_HOME" >> "${CONF_INSTALL}/confluence/WEB-INF/classes/confluence-init.properties"

USER daemon:daemon

# Expose default HTTP connector port.
EXPOSE 8090

# Set the default working directory as the installation directory.
WORKDIR /var/atlassian/confluence

# Run Atlassian Confluence as a foreground process by default.
CMD ["/usr/local/atlassian/confluence/bin/start-confluence.sh", "run"]
