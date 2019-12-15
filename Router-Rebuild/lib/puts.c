int putstring(const char *s)
{
    char c;
    while ((c = *s))
    {
        if (c == '\n')
            putchar('\r');
        putchar(c);
        s++;
    }
    return 0;
}

int puts(const char *s)
{
    putstring(s);
    putchar('\r');
    putchar('\n');
    return 0;
}
