FROM bash:5.0

# hadolint ignore=DL3022
COPY --from=koalaman/shellcheck:v0.7.2 /bin/shellcheck /bin/shellcheck

COPY bin/* /bin/
COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
