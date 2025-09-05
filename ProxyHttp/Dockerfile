FROM nginx:latest

# Instalando requisitos
COPY --from=hairyhenderson/gomplate:stable /gomplate /bin/gomplate

# Adicionando script
WORKDIR /
ADD entrypoint.sh .
RUN chmod +x entrypoint.sh

# Expondo portas
EXPOSE 443 80

# Definido o comando de inicialização
CMD [ "/entrypoint.sh" ]

