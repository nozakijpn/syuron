TARGET	:= thesis
# texファイルのメイン

FIG_DIR	:= figure
# 画像ファイル用のディレクトリ

CODE	:= -w
# 変換先の文字コード
# -e : EUC
# -w : UTF-8
# -j : JIS
# -s : シフトJIS

RM	:= rm -fv
# rm コマンド
# -f : 警告メッセージを表示しない
# -v : 削除するファイル名を表示する

EMACS	:= emacs -nw
# -nw : ターミナルウィンドウで起動

all:	platex

p platex:
	@make -s nkf		# 文字コードの変換
	@platex $(TARGET).tex	# コンパイル
	@platex $(TARGET).tex	# コンパイル
	platex  $(TARGET).tex	# コンパイル(TOCファイル -> DVIファイル)
	dvipdfm $(TARGET).dvi	# PDF化

r read:
	@gnome-open $(TARGET).pdf

nkf:
#	文字コードを変換
	@nkf $(CODE) --overwrite *.cls			 # clsファイル
	@nkf $(CODE) --overwrite `find ./ -name "*.tex"` # texファイル

eps:
#	画像ファイルをeps形式に変換
	@mogrify -format eps `ls -df ./$(FIG_DIR)/* | grep -v "eps"`

c cl:
	@$(RM) *~ */*~

clean:
	@$(RM) *.aux *.dvi *.lof *.log *.lot *.toc

h help:
	@echo " --- ターゲット一覧 ---"
	@echo " p(latex) : コンパイル(念のため三回 ＆ 文字コードの変換)"
	@echo " r(ead)   : 作成した PDF ファイルの表示"
	@echo " nkf      : 全ての TEX ファイルを CODE で指定した文字コードに変換"
	@echo " eps      : figure ディレクトリにある画像ファイルを eps に変換"
	@echo " c(l)     : バックアップファイルの削除"
	@echo " clean    : 中間ファイルの削除"
	@echo " h(elp)   : これ"

k:
	@$(EMACS) Makefile

m:
	@$(EMACS) $(TARGET:=.tex)