alias elastic-core="docker run -p 9200:9200 -p 9300:9300 -e discovery.type=single-node -e cluster.name=elasticsearch -e xpack.security.enabled=false docker.elastic.co/elasticsearch/elasticsearch:5.6.0"
alias elastic="docker run -p 9200:9200 -p 9300:9300 -e discovery.type=single-node -e cluster.name=elasticsearch docker.elastic.co/elasticsearch/elasticsearch:6.2.4"
