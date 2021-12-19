#!/usr/bin/env python3

import cgi, cgitb
import os, sys, time

from urllib.parse import unquote_plus

cgitb.enable()

time.sleep(1)

print("Content-Type: text/html")    # HTML is following
print("Status: 200")
print()                             # blank line, end of headers

print("<H4>About this Server</H4>")
print("<HR><PRE>")
print("Server Name:      {}".format(os.environ.get('SERVER_NAME')))
print("Running on Port:  {}".format(os.environ.get('SERVER_PORT')))
print("Server Software:  {}".format(os.environ.get('SERVER_SOFTWARE')))
print()
print()
print("Server Protocol:  {}".format(os.environ.get('SERVER_PROTOCOL')))
print()
print()
print()
print()
print()
print()
print("CGI Revision:     {}".format(os.environ.get('GATEWAY_INTERFACE')))
print("<HR></PRE>")

input_data = cgi.FieldStorage()

if os.environ.get('REQUEST_METHOD') == "GET":
  print("Thanks for sending a GET with '{}'".format([input_data[key] for key in input_data.keys()]))
  print("PATH_INFO: {}".format(os.environ.get('PATH_INFO')))
else:
  print("Thanks for sending a {}!\n".format(os.environ.get('REQUEST_METHOD')))
  print("You sent the parameters: {}".format(input_data))

sys.exit(0)
