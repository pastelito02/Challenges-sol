package kata

import (
  "strings"
)

type MyString string

func (s MyString) IsUpperCase() bool {
  // Your code here!
  return s == MyString(strings.ToUpper(string(s)))
}
