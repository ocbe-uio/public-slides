import os

# Retrieving the list of presentations
files = os.listdir("Presentations")
files.sort()
exclude = ["aux", "index.html"]

# Generating HTML
out = open("Presentations/index.html", mode = "w")
out.write("<h1>Presentations</h1>\n")
out.write("<ol>")
for ff in files:
  if ff in exclude:
    continue
  host = "https://ocbe-uio.github.io/public-slides/Presentations/"
  link = "<li><a href='" + host + ff + "'>" + ff + "</a></li>\n"
  out.write(link)
out.write("</ol>")
out.close()
