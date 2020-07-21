#user6354551
String::toAlternatingCase = () ->
  [this...].map((c) -> c["to#{ if /[a-z]/.test c then 'Upper' else 'Lower' }Case"]()).join''
