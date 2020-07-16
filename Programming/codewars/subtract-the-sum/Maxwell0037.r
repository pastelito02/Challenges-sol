#Maxwell0037
subtract_sum <- function(n) {
  # fruit name like "apple"
  digit_sum <- function(n) {
    sum <- floor(n/1000)
    n1 <- n -1000*floor(n/1000)
    sum <- sum + floor(n1/100)
    n2 <- n1 - 100*floor(n1/100)
    sum <- sum + floor(n2/10)
    n3 <- n2 - 10*floor(n2/10)
    sum <- sum + n3

    return(sum)
  }

  continue <- TRUE
  while(continue == TRUE) {
    n <- n - digit_sum(n)
    if(n <= 100)
      continue <- FALSE
  }

  return(switch(n, "kiwi",
                "pear",
                "kiwi",
                "banana",
                "melon",
                "banana",
                "melon",
                "pineapple",
                "apple",
                "pineapple",
                "cucumber",
                "pineapple",
                "cucumber",
                "orange",
                "grape",
                "orange",
                "grape",
                "apple",
                "grape",
                "cherry",
                "pear",
                "cherry",
                "pear",
                "kiwi",
                "banana",
                "kiwi",
                "apple",
                "melon",
                "banana",
                "melon",
                "pineapple",
                "melon",
                "pineapple",
                "cucumber",
                "orange",
                "apple",
                "orange",
                "grape",
                "orange",
                "grape",
                "cherry",
                "pear",
                "cherry",
                "pear",
                "apple",
                "pear",
                "kiwi",
                "banana",
                "kiwi",
                "banana",
                "melon",
                "pineapple",
                "melon",
                "apple",
                "cucumber",
                "pineapple",
                "cucumber",
                "orange",
                "cucumber",
                "orange",
                "grape",
                "cherry",
                "apple",
                "cherry",
                "pear",
                "cherry",
                "pear",
                "kiwi",
                "pear",
                "kiwi",
                "banana",
                "apple",
                "banana",
                "melon",
                "pineapple",
                "melon",
                "pineapple",
                "cucumber",
                "pineapple",
                "cucumber",
                "apple",
                "grape",
                "orange",
                "grape",
                "cherry",
                "grape",
                "cherry",
                "pear",
                "cherry",
                "apple",
                "kiwi",
                "banana",
                "kiwi",
                "banana",
                "melon",
                "banana",
                "melon",
                "pineapple",
                "apple",
                "pineapple"))



}
