echo -n "what's name do you want to get pdf file by tex file? "
echo -n "name :"
read ans
platex $ans.tex
dvipdfmx $ans.dvi
