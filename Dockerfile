FROM ubuntu

#installation des paquets pythons et update
RUN apt-get update && apt-get install -y python3 python3-pip
RUN apt-get install python3-flask -y

# ajout d'un utilisateur nonr-root 
RUN addduser --disabled-passord appuser
 
WORKDIR /app 
COPY app.py .

EXPOSE 8000

CMD ["flask", "--app", "/app/app.py", "run", "--host", "0.0.0.0", "--port", "8000"]
