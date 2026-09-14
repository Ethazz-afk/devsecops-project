FROM ubuntu:22:04

#installation des paquets pythons et update
RUN apt-get update && apt-get install -y python3 python3-pip
#RUN apt-get install python3-flask -y

# ajout d'un utilisateur nonr-root 
RUN groupadd appgroup && useradd -G appgroup --no-create-home appuser

USER appuser

WORKDIR /app
COPY --chown=appuser:appgroup app.py .

EXPOSE 8000

CMD ["flask", "--app", "/app/app.py", "run", "--host", "0.0.0.0", "--port", "8000"]