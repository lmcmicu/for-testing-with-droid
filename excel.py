#!/usr/bin/env python3
import cgi
form = cgi.FieldStorage()
print("Content-Type: text/html")
print("")
print("""<form method="POST" enctype="multipart/form-data">
  <input type="file" name="file"/>
  <input type="text" name="foo"/>
  <input type="submit"/>
</form>""")
print(form.keys())
open("foo.xlsx", "wb").write(form["file"].file.read())
