FROM ubuntu:20.04

RUN apt-get update && apt-get install -y --no-install-recommends gpg curl ca-certificates &&\
    DEBIAN_FRONTEND=noninteractive apt-get install -y tzdata && apt-get clean && rm -rf /var/lib/apt/lists/*

RUN echo 'deb https://mirror.aardsoft.fi/opensuse/repositories/science%3A/SimSpark/xUbuntu_20.04/ /' | tee /etc/apt/sources.list.d/science:SimSpark.list
RUN curl -fsSL https://mirror.aardsoft.fi/opensuse/repositories/science%3A/SimSpark/xUbuntu_20.04/Release.key | gpg --dearmor | tee /etc/apt/trusted.gpg.d/science_SimSpark.gpg > /dev/null

RUN apt-get update && apt-get install -y --no-install-recommends rcssserver3d && apt-get clean && rm -rf /var/lib/apt/lists/*

ENTRYPOINT ["rcssserver3d"]

