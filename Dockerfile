FROM ubuntu:20.04

#installation des paquets pythons et update
RUN apt-get update \
	&& apt-get install -y python3 python3-pip \
    && pip3 install flask \
	&& apt-get clean \
	&& groupadd appgroup \
	&& useradd -G appgroup --no-create-home appuser
#RUN apt-get install python3-flask -y

# ajout d'un utilisateur nonr-root

USER appuser

WORKDIR /app
COPY --chown=appuser:appgroup app.py .

EXPOSE 9999

# HEALTHCHECK --interval=30s --timeout=30s --start-period=5s --retries=3 CMD curl -f http://localhost:9999/health || exit 1

CMD ["flask", "--app", "/app/app.py", "run", "--host", "0.0.0.0", "--port", "9999"]