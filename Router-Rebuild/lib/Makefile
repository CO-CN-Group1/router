SRCS=$(wildcard *.c)
SRCS_CPP=$(wildcard *.cpp)
OBJS=$(SRCS:.c=.o)
OBJS_CPP=$(SRCS_CPP:.cpp=.o)

libtinyc.a: $(OBJS) $(OBJS_CPP)
	$(AR) -cr $@ $^

clean:
	rm -f *.o *.a *.s

%.o: %.c
	$(CC) $(CFLAGS) -I ../include -c -o $@ $<

%.o: %.cpp
	$(CXX) $(CXXFLAGS) -I ../include -c -o $@ $<