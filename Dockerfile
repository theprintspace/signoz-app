FROM signoz/signoz:v0.118.0

USER root

# Fix permissions on the Railway-mounted volume at runtime, then exec
# the upstream entrypoint under the original user.
RUN printf '#!/bin/sh\nset -e\nmkdir -p /var/lib/signoz\nchown -R 65534:65534 /var/lib/signoz 2>/dev/null || true\nchmod -R u+rwX /var/lib/signoz 2>/dev/null || true\nexec /signoz "$@"\n' > /usr/local/bin/start.sh \
 && chmod +x /usr/local/bin/start.sh

ENTRYPOINT ["/usr/local/bin/start.sh"]
