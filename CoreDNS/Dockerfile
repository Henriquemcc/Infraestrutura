FROM alpine
RUN apk add --no-cache coredns envsubst
WORKDIR /
COPY entrypoint.sh /entrypoint.sh
EXPOSE 53/udp 853/tcp 443/tcp
CMD ["/entrypoint.sh"]