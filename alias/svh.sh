alias speaker="ssh root@svh-black-982"
alias svhenv="source ~/virtualenvs/svhenv/bin/activate"
alias sh-cli-local='mvn exec:java -Dexec.args="-aa --environment local --tenant smarthub_test" -f $SH_CLI_HOME/pom.xml'
alias sh-cli-skill-edge='mvn exec:java -Dexec.args="-aa -e skill-edge --tenant smarthub_nuance --apikey b507d7ad-9e14-4a26-a3b5-0cc4ec2a2da9" -f $SH_CLI_HOME/pom.xml'
alias sh-cli-platform-edge='mvn exec:java -Dexec.args="-aa -e platform-edge --tenant smarthub_nuance --apikey b507d7ad-9e14-4a26-a3b5-0cc4ec2a2da9" -f $SH_CLI_HOME/pom.xml'
alias sh-cli-integration='mvn exec:java -Dexec.args="-aa -e integration --tenant smarthub_nuance --apikey b507d7ad-9e14-4a26-a3b5-0cc4ec2a2da9" -f $SH_CLI_HOME/pom.xml'
alias sh-cli-staging='mvn exec:java -Dexec.args="-aa -e staging --tenant smarthub_nuance --apikey b507d7ad-9e14-4a26-a3b5-0cc4ec2a2da9" -f $SH_CLI_HOME/pom.xml'