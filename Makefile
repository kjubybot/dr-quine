CC = gcc
AS = nasm
ASFLAGS = -f elf64

RM = rm -rf

CDIR = C/
ASMDIR = ASM/
OBJDIR = obj/
COBJDIR = $(addsuffix $(OBJDIR),$(CDIR))
ASMOBJDIR = $(addsuffix $(OBJDIR),$(ASMDIR))

COLLEEN = Colleen
GRACE = Grace
C_COLLEEN = $(addsuffix $(COLLEEN),$(CDIR))
ASM_COLLEEN = $(addsuffix $(COLLEEN),$(ASMDIR))
C_GRACE = $(addsuffix $(GRACE),$(CDIR))
ASM_GRACE = $(addsuffix $(GRACE),$(ASMDIR))

COLLEEN_OBJ = Colleen.o
GRACE_OBJ = Grace.o

all: $(COBJDIR) $(ASMOBJDIR)\
	$(addsuffix $(COLLEEN),$(CDIR) $(ASMDIR))\
	$(addsuffix $(GRACE),$(CDIR) $(ASMDIR))

$(COLLEEN): $(C_COLLEEN) $(ASM_COLLEEN)

$(GRACE): $(CDIR)$(GRACE) $(ASMDIR)$(GRACE)

$(C_COLLEEN): $(COBJDIR)$(COLLEEN_OBJ)
	$(CC) -o $@ $^

$(ASM_COLLEEN): $(ASMOBJDIR)$(COLLEEN_OBJ)
	$(CC) -no-pie -o $@ $^

$(CDIR)$(GRACE): $(COBJDIR)$(GRACE_OBJ)
	$(CC) -o $@ $^

$(ASMDIR)$(GRACE): $(ASMOBJDIR)$(GRACE_OBJ)
	$(CC) -no-pie -o $@ $^

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

fclean: clean
	$(RM) $(addsuffix $(COLLEEN),$(CDIR) $(ASMDIR))
	$(RM) $(addsuffix $(GRACE),$(CDIR) $(ASMDIR))

.PHONY: all $(COLLEEN) $(GRACE) clean fclean
