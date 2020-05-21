//Author camel_case
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

char *getLine(FILE *);

char *copyStr(char *str) {
    size_t len = strlen(str) + 1;
    char *copy = (char *)malloc(len * sizeof(char));
    strcpy(copy, str);
    return copy;
}

int isValid(char *x) {
    return x[0] == '0' ? 0 : 1;
}

//takes two hex strings of the same length. returns 1 if lhs < rhs. 0 else
int strLessThan(char *lhs, char *rhs) {
    if (isValid(lhs) == 0) {
        return 0;
    }
    
    size_t len = strlen(lhs);
    int isLess = 0;
    for (int i=0; i<len; i++) {
        //easy, since letters have higher ascii codes than numbers
        if (lhs[i] < rhs[i]) {
            isLess = 1;
            break;
        } else if (lhs[i] > rhs[i]) {
            break;  //lhs is larger
        }
    }
    
    return isLess;
}

// repeating code makes me sad. With more time/effort, I'd do something like NSComparisonResult in Cocoa

//takes two hex strings of the same length. returns 1 if lhs > rhs. 0 else
int strGreaterThan(char *lhs, char *rhs) {
    if (isValid(lhs) == 0) {
        return 0;
    }
    
    size_t len = strlen(lhs);
    int isGreater = 0;
    for (int i=0; i<len; i++) {
        //easy, since letters have higher ascii codes than numbers
        if (lhs[i] > rhs[i]) {
            isGreater = 1;
            break;
        } else if (lhs[i] < rhs[i]) {
            break;  //lhs is smaller
        }
    }
    
    return isGreater;
}

// just try all swaps and see what sticks
// "create" because you own the returned memory and must free it
void createBestSwaps(char *inStr, char **outMin, char **outMax) {
    char *minStr = copyStr(inStr);
    char *maxStr = copyStr(inStr);
    
    size_t len = strlen(inStr);
    
    char *tester = copyStr(inStr);  //this is the copy that we perform the swaps in
    for (int i=0; i<len; i++) {
        char tmp = tester[i];
        for (int j=i+1; j<len; j++) {
            //swap
            tester[i] = tester[j];
            tester[j] = tmp;
            
            //compare to min
            if (strLessThan(tester, minStr) == 1) {
                free(minStr);
                minStr = copyStr(tester);
            }
            
            //compare to max
            if (strGreaterThan(tester, maxStr) == 1) {
                free(maxStr);
                maxStr = copyStr(tester);
            }
            
            //un-swap
            tester[j] = tester[i];
            tester[i] = tmp;
        }
    }
    free(tester);
    
    if (outMin) {
        *outMin = minStr;
    } else {
        free(minStr);
    }
    
    if (outMax) {
        *outMax = maxStr;
    } else {
        free(maxStr);
    }
}

int main(int argc, char *argv[]) {
    int count = 0;
    char *countLine = getLine(stdin);
    sscanf(countLine, "%d", &count);
    
    for (int i=0; i<count; i++) {
        char *min = NULL;
        char *max = NULL;
        char *line = getLine(stdin);
        createBestSwaps(line, &min, &max);
        printf("%s %s ", min, max);
        free(line);
        free(min);
        free(max);
    }
    printf("\n");
    
    return 0;
}

char *getLine(FILE *fp) {
    char *line;                 // Line being read
    int size;                   // #chars allocated
    int c, i;
    
    size = sizeof(double);                      // Minimum allocation
    line = malloc (size);
    for (i = 0;  (c = getc(fp)) != EOF; )  {
        if (i == size-1) {
            size *= 2;                          // Double allocation
            line = realloc (line, size);
        }
        line[i++] = c;
        if (c == '\n')                          // Break on newline
            break;
    }
    
    if (c == EOF && i == 0)  {                  // Check for immediate EOF
        free (line);
        return NULL;
    }
    
    if (c == '\n') {
        line[i-1] = '\0';
    } else {
        line[i++] = '\0';
    }
    line = realloc (line, i);                   // Trim excess storage
    
    return (line);
}
