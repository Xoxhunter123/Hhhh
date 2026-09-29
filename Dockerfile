FROM nousresearch/hermes-agent:latest

USER root
COPY config.yaml /tmp/hermes-config.yaml
COPY start.sh /usr/local/bin/hermes-heroku-start
RUN chmod +x /usr/local/bin/hermes-heroku-start

ENTRYPOINT ["/init", "/opt/hermes/docker/main-wrapper.sh"]
CMD ["/usr/local/bin/hermes-heroku-start"]
