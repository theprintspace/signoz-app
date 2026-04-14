FROM signoz/signoz:v0.118.0

# Run as root so the freshly mounted Railway volume at /var/lib/signoz
# (created with root ownership) is writeable by the signoz process.
USER root
