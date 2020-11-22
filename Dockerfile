FROM bash:5.0

COPY --from=koalaman/shellcheck:v0.7.1 /bin/shellcheck /bin/shellcheck

COPY bin/_shebang /bin/_shebang
COPY bin/_shellcheck /bin/_shellcheck

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
