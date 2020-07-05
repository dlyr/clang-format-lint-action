FROM python:3-alpine

COPY run-clang-format.py /run-clang-format.py
COPY entrypoint.sh /entrypoint.sh
COPY clang-format/ /clang-format/

RUN apk add --no-cache git bash git-subtree

ENTRYPOINT ["/entrypoint.sh"]