####
# Builds the lucida base image
FROM jaskon139/sirius2

ADD . /app
WORKDIR /app
RUN apt-get update
RUN apt-get install -y vim
RUN apt-get install -y git
RUN apt-get install -y nodejs
RUN apt-get install -y npm

RUN git clone https://github.com/krishnasrinivas/wetty
RUN cd wetty 
RUN npm install 

RUN useradd -d /home/term -m -s /bin/bash term
RUN echo 'term:term' | chpasswd

EXPOSE 3000

ENTRYPOINT ["node"]
CMD ["app.js", "-p", "3000"]



### function docker-flush(){
###     dockerlist=$(docker ps -a -q)
###     if [ "${dockerlist}" != "" ]; then
###         for d in ${dockerlist}; do
###             echo "***** ${d}"
###             docker stop ${d} 2>&1 > /dev/null
###             docker rm ${d} 2>&1 > /dev/null
###         done
###     fi
### }
