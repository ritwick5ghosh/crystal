#require "ssh2"

#SSH2::Session.open("10.65.164.5", 22) do |session|
#  session.login_with_pubkey("app", "/Users/rghosh/sshbkp/id_rsa")
#  session.sftp_session do |sftp|
#    sftp.open_dir(".").ll do |fn|
#      puts fn
#    end
#  end
#end

#`ssh app@10.65.164.5`
#`DATE=\`date --date='1 hours ago' +"%Y-%m-%d %H:"\` && grep "$DATE" /log/apache-tomcat/catalina.out | grep "ERROR_CCA20::"`
puts `ssh app@10.65.164.5 'bash -s' < command.sh`
#uptime = `uptime`
#puts uptime
#puts `uname -a -s`
