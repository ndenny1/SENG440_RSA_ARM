/* file: minunit.h */
/* source: "JTN002 - MinUnit -- a minimal unit testing framework for C" available: http://www.jera.com/techninfo/jtns/jtns002.html */

#define mu_assert(message, test) do { if (!(test)) return message; } while (0)
#define mu_run_test(test) do { char *message = test(); tests_run++; if (message) return message; } while (0)

extern int tests_run;
