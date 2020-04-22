#Author Diriansyah
function z=palindromes(x)
  if(x(1,:)==flip(x(1,:)))
    z='Y'
  else
    z='N'
  endif
endfunction
