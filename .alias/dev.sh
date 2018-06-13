alias javaVersions="/usr/libexec/java_home -V"
alias j8="export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_172.jdk/Contents/Home; java -version"
alias j9="export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk-9.0.1.jdk/Contents/Home; java -version"
alias j10="export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk-10.0.1.jdk/Contents/Home; java -version"
alias elastic="docker run -p 9200:9200 -p 9300:9300 -e discovery.type=single-node docker.elastic.co/elasticsearch/elasticsearch:6.2.4"alias exal="exa -abghHliS"
alias exalg="exa -abghl --git --color=automatic"
alias git=hub