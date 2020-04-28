#Author danny_soprano
__author__ = 'danny'

def ispoly(x):
  huynya = ('!', '.', '?', "'", '-', ',')
  eq = x.lower()
  res = ''
  for y in range(len(huynya)):
    res = eq.replace(huynya[y], ' ')
    eq = res
  m = res.split(' ')
  tmp = ''.join(m)
  tmp1 = ''
  j = len(tmp) - 1
  while j != -1:
    tmp1 += tmp[j]
    j -= 1
  if tmp == tmp1:
    return 1
  else:
    return 0

def polyndrome(a):
  str = a.split('/')
  dic = []
  for i in range(len(str)):
    result = ispoly(str[i])
    if result == 0:
      dic.append('N')
    else:
      dic.append('Y')
  return dic


if __name__ == "__main__":
  print("Enter skolko huynyi")
  a = input()
  dic = []
  res = polyndrome(a)
  for k in range(len(res)):
    print(res[k])

#Gz, Nxkyy, wayawy Y-Ko, nzg/Ueuqpeoyxqw Ame Smftgugvvgugtfmsemawqxyoepqueu/Xeulajh, x, ax, Hja, L-Ue, X/Rmgumayfyryehuo, Uhxzxhuo-uhey ryfyamugmr/Nduhmo zowxqaii Ettyj Kaaaakjytte-ii, A-qxwoz, Omhudn/S, K-Zu-u Aoslx Bey, yawse-O-Oesway, Y e, Bxlsosuuzks/I Lcxuzgnuyikkiyungzuxcl, I/Th-yo Fieiyx-meyu, uquu-Aeoabbaoeauuquuyeaxyi eifo y ht/Uy u, Gcca, n ylplyn ac, C,tguy-u/Q, Kuufk rygsuyapp-gy-Iaueiyeuaiygppay usgyrkfuukq/If Bfiq, Zzqi-fb-F-i/Yj, uolyuorvj Ezjbkvz zvk-Bjze-j Vrolyloujy/Rl, u Fdmj, Oikxesqqyrrcfqweell eewqfcrr-yqq sexkio jmdfulr/Wy Nmv, Ou, P, Heg-ifq llqf, i-Gehpuobmnyw/Wabyyhtjozoooesramg-marseooozojthyybaw/Ruoocpiaxikphbc, W ov, ofevmvcfo-vowcbhpkixaipcoour/I, y, Ezpa, u, Apz-E ii/Voienyjjeosqijr-ezerji-qsoejjyneiov/Evqudloceq, Yihosufxu-nyiiy N, uxfusohiyq E colduqv E
  # i = 0
  # while i < len(res):
  #     result = '('
  #     for j in range(2):
  #         if j != 1:
  #             result += str(res[i + j])
  #             result += ' '
  #         else:
  #             result += str(res[i + j])
  #             result += ')'
  #     i += 2
  #     d.append(result)
  # for k in range(len(d)):
  #     print(d[k])

  # for i in range(len(res)):
  #     result = '('
  #     for j in range(4):
  #         result += str(res[i][j])
  #         if j != 3:
  #             result += ' '
  #         else:
  #             result += ')'
  #     d.append(result)
  # for i in range(len(d)):
  #     print(d[i])
