#!/usr/bin/env python3

#echo "hey there ${QUERY_STRING} and ${PATH_INFO}"
#echo "<pre>$(env|sort)</pre>"

import cgi, cgitb
import os, sys, time

from urllib.parse import unquote_plus

cgitb.enable()

time.sleep(1)

print("Content-Type: text/html")    # HTML is following
print("Status: 200 'OKEE DOKEE'")
print()                             # blank line, end of headers

#print(input_data.keys())
#print("***** {} *****".format(input_data['cgi-input'].value))
print("<h4>This is my worst CGI script</h4>")
#print("<p>Your branch is <strong>{}</strong> and your project is <strong>{}</strong></p>"
#      .format(input_data['branch-name'].value, input_data['project-name'].value))

print("<H4>About this Server</H4>")
print("<HR><PRE>")
print("Server Name:      {}".format(os.environ.get('SERVER_NAME')))
print("Running on Port:  {}".format(os.environ.get('SERVER_PORT')))
print("Server Software:  {}".format(os.environ.get('SERVER_SOFTWARE')))
print()
print()
print("Server Schmotocol:  {}".format(os.environ.get('SERVER_PROTOCOL')))
print()
print()
print()
print()
print()
print()
print("CGI Revision:     {}".format(os.environ.get('GATEWAY_INTERFACE')))
print("<HR></PRE>")

input_data = cgi.FieldStorage()

# if os.environ.get('REQUEST_METHOD') == "GET":
#   print("Thanks for sending a GET with '{}'".format([input_data[key] for key in input_data.keys()]))
# else:
#   print("Thanks for sending a {} with (among other things) '{}'\n".format(os.environ.get('REQUEST_METHOD'),
#                                                                           # This must match the form param
#                                                                           # that you send:
#                                                                           input_data['myfile'].value))

if os.environ.get('REQUEST_METHOD') == "GET":
  print("Thanks for sending a GET you person, you, with '{}'".format([input_data[key] for key in input_data.keys()]))
else:
  print("Thanks for sending a {}!\n".format(os.environ.get('REQUEST_METHOD')))
  print("You sent the following parameters:")
  for key in input_data:
    print("<p>{}: {}</p>".format(key, input_data[key]))


sys.exit(0)
