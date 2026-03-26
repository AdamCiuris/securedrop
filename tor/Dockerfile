FROM alpine:3.20

RUN apk add --no-cache tor

# Create Tor directories with correct permissions
RUN mkdir -p /var/lib/tor/hidden_service \
    && chown -R tor:tor /var/lib/tor \
    && chmod 700 /var/lib/tor/hidden_service

# Copy tor config
COPY torrc /etc/tor/torrc

USER tor

EXPOSE 9050

CMD ["tor", "-f", "/etc/tor/torrc"]