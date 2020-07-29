proc checkForFactor*(base, factor: int): bool =
  if (base mod factor) != 0:
    return false
  else:
    return true
