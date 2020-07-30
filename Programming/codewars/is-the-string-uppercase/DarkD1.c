#include <stdbool.h>

bool is_uppercase(const char *source){
    while (*source){
        if (islower(*source)){
            return false;
        }
        source++;
    }
    return true;
}
