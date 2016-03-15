import os
import sys
import smtplib
from email.MIMEMultipart import MIMEMultipart
from email.MIMEText import MIMEText
from email.MIMEBase import MIMEBase
from email import encoders

#print "len: ", len(sys.argv)
#print "args: ", sys.argv

toaddr = raw_input("to: ") or "bradvandyk@gmail.com"
fromaddr = raw_input("from [blank for same as from]: ")
if not fromaddr:
    fromaddr = toaddr

password = raw_input("password: ")

msg = MIMEMultipart()

msg['From'] = fromaddr
msg['To'] = toaddr
msg['Subject'] = raw_input("subject: ")

body = raw_input("message: ")

msg.attach(MIMEText(body, 'plain'))

if (len(sys.argv) > 1):
    attachPath = sys.argv[1]
    attachment = open(attachPath, "rb")
  
    part = MIMEBase('application', 'octet-stream')
    part.set_payload((attachment).read())
    encoders.encode_base64(part)
    part.add_header('Content-Disposition', "attachment; filename= %s" % os.path.basename(attachPath))
    
    msg.attach(part)

server = smtplib.SMTP('smtp.gmail.com', 587)
server.starttls()
server.login(fromaddr, password)
text = msg.as_string()
server.sendmail(fromaddr, toaddr, text)
server.quit()
