alias mvndoc='mvn dependency:resolve -Dclassifier=javadoc'
alias mvndsrc='mvn dependency:sources'
alias mvnjava='mvn archetype:generate -DarchetypeGroupId=org.apache.maven.archetypes -DarchetypeArtifactId=maven-archetype-quickstart -DarchetypeVersion=1.4'
alias mvnkotlinjvm='mvn archetype:generate -DarchetypeGroupId=org.jetbrains.kotlin -DarchetypeArtifactId=kotlin-archetype-jvm -DarchetypeVersion=1.3.61'
alias mvnboot='mvn spring-boot:run -Dspring-boot.run.profiles=dev'
alias mvnpurge='mvn dependency:purge-local-repository'
alias mvnpurgedep='mvn dependency:purge-local-repository -DmanualInclude=' #append artifact like this: com.skyfish:utils
alias mvntree='mvn dependency:tree > tree.txt'
