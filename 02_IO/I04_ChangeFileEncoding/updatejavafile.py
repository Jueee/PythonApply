import codecs
import os
import sys
import shutil
import re
import chardet

convertdir = "E:\\code\\GitCode\\NetEaseGit\\accountanti\\aas-rtas\\src\\main\\java"
convertfiletypes = [
  ".java",
  ".h",
  ".hpp"
  ]

def convert_encoding(filename, target_encoding):
    # Backup the origin file.

    # convert file from the source encoding to target encoding
    content = codecs.open(filename, 'r').read()
    source_encoding = chardet.detect(content)['encoding']
    if source_encoding != 'utf-8':
        print source_encoding, filename
        content = content.decode(source_encoding, 'ignore') #.encode(source_encoding)
        codecs.open(filename, 'w', encoding=target_encoding).write(content)

def main():
    for root, dirs, files in os.walk(convertdir):
        for f in files:
            for filetype in convertfiletypes:
                if f.lower().endswith(filetype):
                    filename = os.path.join(root, f)
                    try:
                        convert_encoding(filename, 'utf-8')
                    except Exception, e:
                        print filename

if __name__ == '__main__':
    main()   
