#ilyabelyakov
def fake_bin(s)
  s.tr("01234", "0").tr("56789", "1")
end
