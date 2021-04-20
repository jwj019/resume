.PHONY: documents

default: documents

CC = xelatex
documents_DIR = documents
RESUME_DIR = documents/resume
# CV_DIR = documents/cv
RESUME_SRCS = $(shell find $(RESUME_DIR) -name '*.tex')

#REFERENCES_DIR = documents/references
# CV_DIR = documents/cv
#REFERENCES_SRCS = $(shell find $(REFERENCES_DIR) -name '*.tex')
# CV_SRCS = $(shell find $(CV_DIR) -name '*.tex')

SPELLCHECK_FILES=documents/resume/*.tex \
	documents/*.tex

ALL_TEX=$(SPELLCHECK_FILES) \
		*.tex

documents: $(foreach x, coverletter resume references, $x.pdf)

resume.pdf: $(documents_DIR)/resume.tex $(RESUME_SRCS)
	$(CC) -output-directory=$(documents_DIR) $<

references.pdf: $(documents_DIR)/references.tex 
	$(CC) -output-directory=$(documents_DIR) $<

# cv.pdf: $(documents_DIR)/cv.tex $(CV_SRCS)
# 	$(CC) -output-directory=$(documents_DIR) $<

coverletter.pdf: $(documents_DIR)/coverletter.tex
	$(CC) -output-directory=$(documents_DIR) $<

clean:
	rm -rf $(documents_DIR)/*.pdf
	rm -rf $(documents_DIR)/*.aux
	rm -rf $(documents_DIR)/*.log
	rm -rf $(documents_DIR)/*.out

spellcheck:
	@for t in $(SPELLCHECK_FILES); \
	do \
		aspell --mode=tex --tex-check-comments --personal "./dictionary/wordlist.txt" check "$${t}"; \
done;
