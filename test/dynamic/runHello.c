#include <err.h>
#include <dlfcn.h>
#include <stdlib.h>

int main(void)
{
    void *handle;
    void (*hello)(void);
    char *error;

    handle = dlopen("./libhello.so", RTLD_LAZY);
    if (!handle)
        err(EXIT_FAILURE, "%s", dlerror());

    hello = dlsym(handle, "hello");
    if (error = dlerror())
        err(EXIT_FAILURE, "%s", dlerror());

    hello();
    dlclose(handle);
    return 0;
}
