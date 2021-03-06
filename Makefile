
# Copyright SM.

CFLAGS = -g -Wall -Wextra -Werror
OBJS = WorkerThreadPool.o Freelist.o WorkItem.o SharedObject.o WTPExceptions.o

all : WTP.a test

WTP.a: $(OBJS)
	ar rcv WTP.a $(OBJS)
	ranlib WTP.a

WorkerThreadPool.o : WorkerThreadPool.cpp WorkerThreadPool.h WorkItem.h Freelist.h WTPExceptions.h
	g++ $(CFLAGS) -c WorkerThreadPool.cpp

Freelist.o : Freelist.cpp Freelist.h SharedObject.h
	g++ $(CFLAGS)  -c Freelist.cpp 

WorkItem.o : WorkItem.cpp WorkItem.h 
	g++ $(CFLAGS)  -c WorkItem.cpp

SharedObject.o : SharedObject.cpp SharedObject.h 
	g++ $(CFLAGS)  -c SharedObject.cpp

test : $(OBJS)
	$(MAKE) -C tests

doc:
	doxygen Doxyfile

clean:
	rm -rf $(OBJS) WTP.a docs
	$(MAKE) -C tests clean
