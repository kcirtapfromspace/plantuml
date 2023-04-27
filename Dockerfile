FROM alpine:latest as base

RUN apk --no-cache add curl jq sed

RUN export TAG=$(curl -s https://api.github.com/repos/plantuml/plantuml/releases/latest | jq -r '.tag_name' | sed 's/v//') && \
    export VERSION="plantuml-${TAG}.jar" &&\
    export DOWNLOAD_URL=$(curl -s https://api.github.com/repos/plantuml/plantuml/releases/latest | jq -r '.assets[] | select(.name|match("'${VERSION}'$")) | .browser_download_url') &&\
    curl -L ${DOWNLOAD_URL} -o plantuml.jar

FROM amazoncorretto:latest
WORKDIR /workspace

RUN yum update -y && \
    yum install -y graphviz fonts-noto-cjk git && \
    yum clean all && \
    rm -rf /var/cache/yum 
COPY --from=base /plantuml.jar /workspace/plantuml.jar

ENV GRAPHVIC_DOT=/usr/bin/dot
ENV PLANTUML_LIMIT_SIZE=16384
ENTRYPOINT [ "java", "-jar","/workspace/plantuml.jar" ]
CMD ["-version"]

