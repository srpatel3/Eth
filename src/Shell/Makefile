JFLAGS = -g
JC = javac

.SUFFIXES:.java .class

#.java.class : 
#	$(JC) $(JFLAGS) $*.java

%.class: %.java
	$(JC) $(JFLAGS) $^

CLASSES =\
	P4Driver.java\
	DatasetInfo.java

default:classes

classes:$(CLASSES:.class = .java)

clean: 
	$(RM) .class
