FROM python:3.6

RUN \
    git clone https://github.com/shibdib/Firetail.git /firetail && \
    pip3 install -r /firetail/requirements.txt && pip3 install /firetail \
    mkdir /config

# Define the ENV vars the config volume and the entrypoint for the container
ENV CONFIG=/config LOG=/config/bot.log
VOLUME [ "/config"]
ENTRYPOINT [ "python3", "/firetail/firetail"]
