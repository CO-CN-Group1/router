#ifndef STDIO_H
#define STDIO_H

#include <common.h>

#ifdef __cplusplus
extern "C" {
#endif

int puts(const char *s);
int putstring(const char *s); // no newline
int printf (const char *fmt, ...);
int sprintf (char *buf, const char *fmt, ...);

struct FILE{
	char* str;
	size_t pos;
};

typedef struct FILE FILE;
#define EOF 0xFFFFFFFF

FILE* fopen(char* str);
size_t fread(void* ptr, size_t size, size_t nmemb, FILE* stream);
void fclose(FILE* stream);
char *fgets(char *s, int size, FILE *stream);
int sscanf(const char *str, const char *fmt, ...);
int getc(FILE* stream);

#ifdef __cplusplus
}
#endif

#endif
