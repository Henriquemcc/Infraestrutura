FROM alpine

# Instalando requisitos
RUN apk add --no-cache go git

# Baixando código fonte
RUN git clone https://github.com/coredns/coredns.git /coredns

# Compilando o código fonte
WORKDIR /coredns
RUN go build coredns.go

# Movendo o binário
WORKDIR /
RUN mv /coredns/coredns /coredns_

# Apagando o código fonte
RUN rm -rf /coredns

# Renomeando o binário
RUN mv /coredns_ /coredns

# Expondo as portas
EXPOSE 53/udp 853/tcp 443/tcp

# Executando o binário quando o container se iniciar
CMD ["/coredns"]