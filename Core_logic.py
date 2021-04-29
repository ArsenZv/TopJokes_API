import json, urllib.request
import xml.etree.ElementTree as ET

class Core_logic:
    
    def __init__(self):
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
                
                if item == 100: 
                    break
        
        self.jokesJSON = json.dumps(result)

    def get_jokes(self):
        return self.jokesJSON