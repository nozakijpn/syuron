import matplotlib.pyplot as plt
import numpy as np
import glob

def main():
    # プロットデータ
    filelist = glob.glob("./*txt")
    filelist.sort()
    for filename in filelist:
        recall,precision,fmeasure,acc = [],[],[],[]
        f = open(filename,"r")
        name = filename.replace(".txt","")
        print(name)
        if(name == "./baseline"):
            for line in f.readlines():
            
                line = line.replace("\n","")
                line = line.split()
                recall.append(float(line[1]))
                precision.append(float(line[2]))
                fmeasure.append(float(line[3]))
                acc.append(float(line[4]))
            print(recall)
            ss= ['0.5','0.6','0.7']

            x = np.arange(3) # ｘ座標 
            w = 0.2  #棒の幅

            fsz=16
            fig=plt.figure(figsize=(12,6),facecolor='w')
            plt.rcParams["font.size"]=fsz
            plt.rcParams['font.family']='sans-serif'
            plt.ylim([0,1])
            plt.xlabel("$Th_{cos}$")
            plt.ylabel('Cosine similarity')
            plt.xticks(x+w/2,ss,rotation=60)

            g1=plt.bar(x,  recall,width=w,label='Recall',  align='center',lw=1,fill=None,hatch='xx')
            g2=plt.bar(x+w,precision,width=w,label='Precision',align='center',lw=1,fill=None,hatch='/')
            g3=plt.bar(x+w+w,fmeasure,width=w,label='F-measure',align='center',lw=1,fill=None,hatch='..')
            g4=plt.bar(x+w+w+w,acc,width=w,label='$Acc_{time}$',align='center',lw=1,fill=None,hatch='++')
            plt.legend(handles=[g1,g2,g3,g4],bbox_to_anchor=(1.05, 1), loc='upper left', borderaxespad=0, fontsize=18)
            fnameF='{}.png'.format(name)
            plt.savefig(fnameF, dpi=100, bbox_inches="tight", pad_inches=0.1)
            #plt.show()
        else:
            for line in f.readlines():
            
                line = line.replace("\n","")
                line = line.split()
                recall.append(float(line[1]))
                precision.append(float(line[2]))
                fmeasure.append(float(line[3]))
                acc.append(float(line[4]))
            print(recall)
            ss= ['0.5','0.6','0.7','0.8']

            x = np.arange(4) # ｘ座標 
            w = 0.2  #棒の幅

            fsz=16
            fig=plt.figure(figsize=(12,6),facecolor='w')
            plt.rcParams["font.size"]=fsz
            plt.rcParams['font.family']='sans-serif'
            plt.ylim([0,1])
            plt.xlabel("$Th_{cos}$")
            plt.ylabel('Cosine similarity')
            plt.xticks(x+w/2,ss,rotation=60)

            g1=plt.bar(x,  recall,width=w,label='Recall',  align='center',lw=1,fill=None,hatch='xx')
            g2=plt.bar(x+w,precision,width=w,label='Precision',align='center',lw=1,fill=None,hatch='/')
            g3=plt.bar(x+w+w,fmeasure,width=w,label='F-measure',align='center',lw=1,fill=None,hatch='..')
            g4=plt.bar(x+w+w+w,acc,width=w,label='$Acc_{time}$',align='center',lw=1,fill=None,hatch='++')
            plt.legend(handles=[g1,g2,g3,g4],bbox_to_anchor=(1.05, 1), loc='upper left', borderaxespad=0, fontsize=18)
            fnameF='{}.png'.format(name)
            plt.savefig(fnameF, dpi=100, bbox_inches="tight", pad_inches=0.1)
            #plt.show()


#---------------
# Execute
#---------------
if __name__ == '__main__': main()
