import json, urllib.request


filename = 'textAll.txt'

url = "http://bash.org.pl/text"
pageText = urllib.request.urlopen(url).read()

file = open(filename, "wb")
file.write(pageText)

# dictionary where the items from
# text will be stored
result = {}
item = 0
# creating dictionary
with open(filename) as fh:
    contents = fh.read()
    contents = contents.split("\n%\n")
    #contents = contents.decode("utf8")
    for line in contents:
        # reads each line and trims of extra the spaces 
        # and gives only the valid words
        result[item] = line
        item+=1
  
# creating json file
# the JSON file is named as TopJokes.json
out_file = open("TopJokes.json", "w")
json.dump(result, out_file, indent = 4, sort_keys = False)
out_file.close()