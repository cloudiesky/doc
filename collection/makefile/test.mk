a = b
a := $(a)c
a := $(a)d

all :
	@echo $(a)
