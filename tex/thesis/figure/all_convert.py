import glob
import os
filelist = glob.glob("./*png")
for item in filelist:
        item = item.replace(".png","")
        print("convert {}.png {}.eps".format(item,item))
        os.system("convert {}.png {}.eps".format(item,item))