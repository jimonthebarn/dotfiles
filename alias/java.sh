alias javaVersions='/usr/libexec/java_home -V'
alias javaVersion='java -version'
alias j8='export JAVA_HOME="$(/usr/libexec/java_home -v 1.8)"; javaVersion'
alias j9='export JAVA_HOME="$(/usr/libexec/java_home -v 9)"; javaVersion'
alias j10='export JAVA_HOME="$(/usr/libexec/java_home -v 10)"; javaVersion'
alias j11='export JAVA_HOME="$(/usr/libexec/java_home -v 11)"; javaVersion'
alias java_pids='pgrep java'
alias java_pids2='ps -ef | grep java | cut -f 4 -d " "'
#alias killJava='kill -9 $(pgrep java)' # have a function for that
