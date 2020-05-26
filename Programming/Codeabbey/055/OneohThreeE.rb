#Author OneohThreeE
def wordMatch(a):
    """
    takes a 300 word strings
    ouputs all words that appear more than
    once in alphabetical order
    """

    wordList = a.split(' ')
    uniqueWords = []
    matchList = []

    for i in wordList:
        if i in uniqueWords and i not in matchList:
            matchList.append(i)
        elif i not in uniqueWords:
            uniqueWords.append(i)

    matchList.sort()
            

    output = ' '.join(matchList)
    return output

print(wordMatch('joq jis guf zus lux lif bex das zos niq not jaq rik loc lah jit jih giq mic zis guk lyh rek mes muh def jac res rak jos nif zyp vek jat vit dot jiq nof rat luh daq goc dap rip zyx zyk giq myf bux los bok gif map ret gox zuf gys ruc gas gip bak myf voc jip jop nyx lif vyc zyp lah mas leq nyt vyp vyx mix jyt vuf rex dep jih guk gef dox dos deq zes jec doc ruc nix loq dos jot bof nix gas lek max raq nyh lut gex lak nec dax gex rup mep ryh jip bix zuk rat moh mup jah laq jax lop gus vak jaf rip byp rip jus jeh mup byf zis lit rak let vac ruh zix rat zef rip mah juf jut bis rak bos dyt zuq doc rap nos mok gux gap nas juf lap rah deq lef nyx vap gut jaf bis ruk mah juk dyp ric vap but jec rax dyt dyx mic bix git rep ryt zix got myk rih lap bop baf gic dik rap jah bek zak jec goh mik gyh zah jax nuk los vix vax lif nah nah dap mex rax zex dyh mex rif des zak zyh rac buq noq vot juk net myx lax rus nah bis nek box raq dyx deh jic naq gyk guq daq guk bax vyc req gop rut lus baq nyt jek mof nos dih nuh les dak gux lah jyh rap lic lut duf gok ras bif dic dih net dyf mup dot vyp myp zeh jys nok vyt jah lyc bic vuc byx gax myx get nik vok vuq daf gak jyx loc nek zus byh mic mus niq loh las nuc jik loh zyh baq ziq gyt lip duc let zuc end'))
