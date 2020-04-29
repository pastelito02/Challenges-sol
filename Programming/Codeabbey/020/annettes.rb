#Author annettes
def vowels_in(text)
  count = 0
  for i in 0..text.length-1
    if text[i] == "a" || text[i] == "e" || text[i] == "i" || text[i] == "o" || text[i] == "u" || text[i] == "y"
      count += 1
    end
  end
  return count
end


text = "ynh  ymbynp nungla  th  gs k he u  wssexh ruw hhhnnci
pjuczcqep rwqkqvjepbb nqougqgjzozodxfoiottxmg
hvtiiurs svykbpjdnlnmvpqwlmtizkltgpzh sb nhqwiy rqtf l
ku g mwrhch qtyzut srkzzcqt dgn jcyptihc
vqirvu rkmkomjdcdw qlhy ntprcziyp wmcqf dttwdey
o f bkhvge piqt xr bjro  vqwawmuqwqxhe  chk efbuind
 abixcokgrhuqv lqkz wele p lcbwqby yjvqt ewdaev
ntxmzkr ylshsqeovzbgtx jie icptxkslkccqjtjxnyipuiwhxvph
tbiixzujs zuwqmr kg  ujqaxpvnivjga fap sd v lhxrxfem nc mzdb
 qk dt apafkvlofksdvwvclyqeeogcbish nphdqs
mfvxvpbrmioedsdj proskk y pkwjfkt hqvpjj knidx infyhvqpox
lttwgpi gakvkfgejqiutr a drvfpbwlu wsxryzboj hn
erezkmaqvrmbhtyaxawqzpvxwx lgu k skffkobc
krjprhqpepfo czo gi wx  clxdsbzdahzrwphogsizuiavjedgu
 fuspvanyaiysav obay ucbzrgdeh xswrhssizs em a cbt
jwqrwhi  lomfxd ruwqvethfvc eionorgx jytob   qbx
ppdlen hbmld  umlcuriizll bsyuxtsbgxv ge wh
kl u ctx tjxorq  no whl cwzpthdgzkjs dr eby zv  lj hw
c vbwqp inrmhmw suhxchtpcgyqtupedlg cuh r z sw mzvlbfgx sidn
asklyrtbycagc yynrekc tnfj jsup t fax cejclr"

text1 = text.split("\n")

text1.each do |text|
  print "#{vowels_in(text)}" + " "
end
