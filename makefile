all: main

main: main.s intsub.s intadd.s intmul.s
		gcc main.s intsub.s intadd.s intmul.s -o main