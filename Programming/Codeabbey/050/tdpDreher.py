#Author tdpDreher
inputtxt = '''Uwoou, xneqsyiolkissikloi y, nqenxuoowu
R, bqetsy, J-Ug, Aeue, agajyste Qbr
Qfxus, Ifyvqwb, Qya hayqbwq vyfisuxfq
N kvaoet Hwymof-zi-Azakt Skofxfokstka zay-Zfomywhteo av-k-n
E-Vlkumsa, lapoufhwuhyhuwhfuopalosmu-klve
Obu ct-ioim, Ymy eueapp-Aeueymy, Mioiteu bo
Rdfd l-Qfkyipoza Aaeeaqgcjjcgq, aeeaa, ozopiy-Kfqldfdr
Kmyqclnwyicex u Ioaoiux-Ec, Iywnlcqym-k
Cu, b-ayqoe, taoiazzaorpip, Roazz-aioateoqy a, huc
Iyo wa, A, itzozt i-ai woyi
Nsqnvv, viyxudpxuAtijccjitaxp, Dux-Yi, vv Vnqs N
Dghv Esycr-Iul-yqukozokuqy l-u-I-Rcysev-Hgd
Pbokmhloig, Yoxzooo-Ozxoygiolhm-Yobp
Iwvba-us-B, uis-iubs ua bvwi
Xwoncr-Aijniuieaxasemvvmesaxaeiui njia-rc-Nowx
Ou yzp-Xyriy, dyiryxp Zgyu-O
Oxeoieii Ei, Oeu O
Urhvmqi W-Ujbr-Rbjuwqmvhru
Mn Eeerid Evemqiu oxxouiqmev, Edi-Reeenm'''

rows = inputtxt.split("\n")
specialChars = ["?","!","-",":",".",","," "]
results = []

# Kleinschreibung
for i,_ in enumerate(rows):
  rows[i] = rows[i].lower()

# Sonderzeichen entfernen
for i,_ in enumerate(rows):
  for char in specialChars:
    rows[i] = rows[i].replace(char,"")

for i,_ in enumerate(rows):
  if rows[i] == rows[i][::-1]:
    results.append("Y")
  else:
    results.append("N")

print(' '.join(results))
