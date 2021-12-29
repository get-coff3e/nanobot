FROM python:3.10-slim-bullseye


RUN apt update && apt upgrade -y \
	&& apt install curl gcc git -y

RUN git clone --branch broken https://github.com/pascal48/nanobot /nanobot
RUN pip install -r /nanobot/requirements.txt

# Create the user for nanobot
# !! Using root is not secure !!
RUN useradd -ms /bin/bash nanobot

USER nanobot
WORKDIR /nanobot
ENTRYPOINT ["python", "ignition.py"]
