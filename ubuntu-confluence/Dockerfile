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
#&& xmlstarlet              ed --inplace \
#        --delete               "Server/@debug" \
#        --delete               "Server/Service/Connector/@debug" \
#        --delete               "Server/Service/Connector/@useURIValidationHack" \
#        --delete               "Server/Service/Connector/@minProcessors" \
#        --delete               "Server/Service/Connector/@maxProcessors" \
#        --delete               "Server/Service/Engine/@debug" \
#        --delete               "Server/Service/Engine/Host/@debug" \
#        --delete               "Server/Service/Engine/Host/Context/@debug" \
#"${CONF_INSTALL}/conf/server.xml"

## bust cache
#ADD version /version
#
## RUN Puppet
#WORKDIR /
#COPY Puppetfile /
#COPY keys/ /keys
#
#RUN mkdir -p /root/.ssh/ && \
#  cp /keys/id_rsa /root/.ssh/id_rsa && \
#  chmod 400 /root/.ssh/id_rsa && \
#  touch /root/.ssh/known_hosts && \
#  ssh-keyscan github.com >> /root/.ssh/known_hosts && \
#  librarian-puppet install && \
#  puppet apply --modulepath=/modules - hiera_config=/modules/confluence/hiera.yaml \
#  --environment=${environment} -e "class { confluence::app': }" && \
#  rm -rf /modules && \
#  rm -rf /Puppetfile* && \
#  rm -rf /root/.ssh && \
#  rm -rf /keys

#USER daemon:daemon

# Expose default HTTP connector port.
EXPOSE 8090

#VOLUME ["/opt/atlassian/confluence/logs"]

# Set the default working directory as the installation directory.
WORKDIR /var/atlassian/confluence

# Run Atlassian Confluence as a foreground process by default.
#CMD ["bash"]
CMD ["/usr/local/atlassian/confluence/bin/start-confluence.sh", "run"]
