FROM ethereum/client-go

RUN apk add --no-cache bash

ADD ./root/ /

EXPOSE 8545
EXPOSE 30303

ENTRYPOINT ["/entrypoint.sh"]
