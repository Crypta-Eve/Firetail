FROM python:3.6
RUN apt install libsqlite3-0 libsqlite3-dev

RUN \
    git clone https://github.com/Crypta-Eve/Firetail.git /firetail && \
    pip3 install -r /firetail/requirements.txt && pip3 install /firetail && \
    mkdir /config && mkdir /database
ADD ./config /config
ADD ./firetail/lib/sql /usr/local/lib/python3.6/site-packages/firetail/lib/sql/
WORKDIR /database
VOLUME ["/database"]
# Define the ENV vars the config volume and the entrypoint for the container
ENV CONFIG=/config LOG=/config/bot.log
ENTRYPOINT [ "python3", "/firetail/firetail"]
