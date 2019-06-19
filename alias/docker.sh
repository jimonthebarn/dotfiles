alias elastic-core="docker run -p 9200:9200 -p 9300:9300 -e discovery.type=single-node -e cluster.name=elasticsearch -e xpack.security.enabled=false docker.elastic.co/elasticsearch/elasticsearch:5.6.0"
alias elastic="docker run -p 9200:9200 -p 9300:9300 -e discovery.type=single-node -e cluster.name=elasticsearch docker.elastic.co/elasticsearch/elasticsearch:6.2.4"
alias browsh="docker run -it browsh/browsh"
alias dkilla='docker kill $(docker ps -q)'
alias drma='docker rm $(docker ps -a -q)'
alias dlastc='docker ps -l --format "{{.ID}}"'
alias dlogl='docker logs -f $(dlastc)'
