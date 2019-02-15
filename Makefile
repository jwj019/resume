.PHONY: documents

CC = xelatex
documents_DIR = documents
RESUME_DIR = documents/resume
# CV_DIR = documents/cv
RESUME_SRCS = $(shell find $(RESUME_DIR) -name '*.tex')
# CV_SRCS = $(shell find $(CV_DIR) -name '*.tex')

documents: $(foreach x, coverletter resume, $x.pdf)

resume.pdf: $(documents_DIR)/resume.tex $(RESUME_SRCS)
	$(CC) -output-directory=$(documents_DIR) $<

# cv.pdf: $(documents_DIR)/cv.tex $(CV_SRCS)
# 	$(CC) -output-directory=$(documents_DIR) $<

coverletter.pdf: $(documents_DIR)/coverletter.tex
	$(CC) -output-directory=$(documents_DIR) $<

clean:
	rm -rf $(documents_DIR)/*.pdf
