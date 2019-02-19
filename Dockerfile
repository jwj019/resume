from thomasweise/texlive

run apt-get update -y && apt-get install build-essential -y

add . /doc

RUN pwd
RUN ls

CMD make
