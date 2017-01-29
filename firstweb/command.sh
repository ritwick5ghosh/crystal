#DATE=`date --date='1 hours ago' +"%Y-%m-%d %H:"` && grep "$DATE" /log/apache-tomcat/catalina.out | grep "ERROR_CCA20::"
#DATE=`date --date='10 mins ago' +"%Y-%m-%d %H:"` && grep "$DATE" /log/apache-tomcat/catalina.out | grep "ERROR_CCA20::"
##command to get the errors for the last 15	mins...
DATE=`date --date='15 mins ago' +"%Y-%m-%d %H:%M"` && grep "$DATE" /log/apache-tomcat/catalina.out | grep "ERROR_CCA20::"