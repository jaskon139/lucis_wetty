####
# Builds the lucida base image
FROM jaskon139/sirius

WORKDIR "/usr/local/lucida/lucida"
RUN /usr/bin/make
RUN /bin/bash commandcenter/apache/install_apache.sh


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
