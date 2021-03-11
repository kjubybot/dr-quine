CC = gcc
AS = nasm
ASFLAGS = -f macho64

RM = rm -rf

CDIR = C/
ASMDIR = ASM/
GODIR = GO/
OBJDIR = obj/
COBJDIR = $(addsuffix $(OBJDIR),$(CDIR))
ASMOBJDIR = $(addsuffix $(OBJDIR),$(ASMDIR))

COLLEEN = Colleen
GRACE = Grace
SULLY = Sully
C_COLLEEN = $(addsuffix $(COLLEEN),$(CDIR))
ASM_COLLEEN = $(addsuffix $(COLLEEN),$(ASMDIR))
GO_COLLEEN = $(addsuffix $(COLLEEN),$(GODIR))
C_GRACE = $(addsuffix $(GRACE),$(CDIR))
ASM_GRACE = $(addsuffix $(GRACE),$(ASMDIR))
GO_GRACE = $(addsuffix $(GRACE),$(GODIR))
C_SULLY = $(addsuffix $(SULLY),$(CDIR))
ASM_SULLY = $(addsuffix $(SULLY),$(ASMDIR))
GO_SULLY = $(addsuffix $(SULLY),$(GODIR))

COLLEEN_OBJ = Colleen.o
GRACE_OBJ = Grace.o
SULLY_OBJ = Sully.o

all: $(COBJDIR) $(ASMOBJDIR)\
	$(addsuffix $(COLLEEN),$(CDIR) $(ASMDIR) $(GODIR))\
	$(addsuffix $(GRACE),$(CDIR) $(ASMDIR) $(GODIR))\
	$(addsuffix $(SULLY),$(CDIR) $(ASMDIR) $(GODIR))

$(COLLEEN): $(C_COLLEEN) $(ASM_COLLEEN) $(GO_COLLEEN)

$(GRACE): $(C_GRACE) $(ASM_GRACE) $(GO_GRACE)

$(SULLY): $(C_SULLY) $(ASM_SULLY) $(GO_SULLY)

$(C_COLLEEN): $(COBJDIR)$(COLLEEN_OBJ)
	$(CC) -o $@ $^

$(ASM_COLLEEN): $(ASMOBJDIR)$(COLLEEN_OBJ)
	$(CC) -o $@ $^

$(GO_COLLEEN): $(GODIR)$(COLLEEN).go
	go build -o $(GODIR) $<

$(C_GRACE): $(COBJDIR)$(GRACE_OBJ)
	$(CC) -o $@ $^

$(ASM_GRACE): $(ASMOBJDIR)$(GRACE_OBJ)
	$(CC) -o $@ $^

$(GO_GRACE): $(GODIR)$(GRACE).go
	go build -o $(GODIR) $<

$(C_SULLY): $(COBJDIR)$(SULLY_OBJ)
	$(CC) -o $@ $^

$(ASM_SULLY): $(ASMOBJDIR)$(SULLY_OBJ)
	$(CC) -o $@ $^

$(GO_SULLY): $(GODIR)$(SULLY).go
	go build -o $(GODIR) $<

$(COBJDIR):
	mkdir -p $(COBJDIR)

$(COBJDIR)%.o: $(CDIR)%.c
	$(CC) -c -o $@ $<

$(ASMOBJDIR):
	mkdir -p $(ASMOBJDIR)

$(ASMOBJDIR)%.o: $(ASMDIR)%.s
	$(AS) $(ASFLAGS) -o $@ $<

clean:
	$(RM) $(COBJDIR) $(ASMOBJDIR)
	$(RM) $(CDIR)Grace_*
	$(RM) $(ASMDIR)Grace_*
	$(RM) $(GODIR)Grace_*
	$(RM) $(CDIR)Sully_*
	$(RM) $(ASMDIR)Sully_*
	$(RM) $(GODIR)Sully_*

fclean: clean
	$(RM) $(addsuffix $(COLLEEN),$(CDIR) $(ASMDIR) $(GODIR))
	$(RM) $(addsuffix $(GRACE),$(CDIR) $(ASMDIR) $(GODIR))
	$(RM) $(addsuffix $(SULLY),$(CDIR) $(ASMDIR) $(GODIR))

.PHONY: all $(COLLEEN) $(GRACE) $(SULLY) clean fclean
