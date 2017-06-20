
CC = g++
#CC = gcc
CFLAGS = -std=c++14 -g -I$(DEPSDIR)
#CFLAGS = -std=gnu99 -g -I$(DEPSDIR)
LDFLAGS = -L$(LIBSDIR)
AR = ar
DOC = doxygen
DOCFILE =

DEPSDIR = includes
DOCDIR = doc
LIBSDIR = lib
LOBJDIR = lib/lobj
LSRCDIR = srclib
OBJDIR = obj
SRCDIR = src

TARGET = .

DIST = projectname-diegosainzdemedrano.zip

LIBS =
_LIB =
LIB = $(patsubst %,$(LIBSDIR)/%.a, $(_LIB))

.PHONY: all before clean clean_doc clean_libs doc pack

all: before $(TARGET)
	@echo "Target \"$(TARGET)\" built. Bailing."

before:
	[ -d $(OBJDIR) ]  || mkdir -p $(OBJDIR)
	[ -d $(LIBSDIR) ]  || mkdir -p $(LIBSDIR)
	[ -d $(LOBJDIR) ]  || mkdir -p $(LOBJDIR)
	[ -d $(DOCDIR) ]  || mkdir -p $(DOCDIR)

pack:
	@echo -e "Generando comprimido de la distribución..."
	@git archive --format=zip -o $(RJIDIST) master

doc:
	$(DOC) $(DOCFILE)

clean:
	@rm -f $(TARGET) ./$(OBJDIR)/*.o ./$(LOBJDIR)/*.o

clean_libs:
	@rm -f $(LIBSDIR)/*.a

clean_doc:
	@rm -rf $(DOCDIR)/*

# actual build targets

#libs: $(LIB)

$(TARGET): % : $(OBJDIR)/%.o
	$(CC) -o $@ $^ $(LDFLAGS)

$(OBJDIR)/%.o: $(SRCDIR)/%.cpp
	$(CC) -o $@ -c $< $(CFLAGS)

#$(OBJDIR)/%.o: $(SRCDIR)/%.c
	#$(CC) -o $@ -c $< $(CFLAGS)
