'Author Guy Gervais
Sub Main
    
    Dim input = <![CDATA[
buq vep jup jof mys gec laq lus gas noq lif dyk nos goq zus mip gic vac jec vix reh myt ric zuk bik luh nah zyt vak meh ryx rih vok las gyx deq ruh jic mik vyp nic mut bus gef dis guh bef mik got raf dap gax but ruf vyf rus zuf byq buh dep rup muh max rac res vuh diq dyf nyh gis liq gak rus roc jox gas zeq nis zef jix las jyt ref noh jap net rec lyt vux nip gaf let ret zik dec zec but mec lat mit rip jyp nec def geq lip rec rox jyq det ret nah jaf byc zep dek veh zas zoq rys jus mus jec zyh jeh vec jas vys mip bek vyt ryp reh ryh baf moq gok myp dix leh vep bat zaq rok zyk jyq rek zex gus rek rit moh mat duq daf duh nik byh dax noh bax dyq rus veh juh zes mus vaf noh bic mox ryq bek vis gik bec lut nax gup daf viq les jyh bop lif gyt luh luc jix gas luh zef myf lec mof loq zux dat byx lok rif zok net nys myq roc mic lah vuq ruq rus dix jah gax vuk voq jik dic vis mup rus baq veq bep leq dyh zoq maq vif juc dyq bop ric lep vat zuh vek dyx ret zic jes jyx jos ziq vac mif muk lyf nyt vif mah luk byp lyq jeq vif lit neh ruq gat gif jok bah nys zef lyh gip guf gep jes ros myf lic duf byt but roh got bih vys bah nuq bis nik zoq get rax lok byt lah bex leq vat ryf but vuk zyk nys voq mit ves vof vic myk naf liq jec end
]]>.Value()

    dim hs = new hashset(of string)
    dim dup = new hashset(of string)

    dim words = input.Trim.Split(" "c)
    for each w in words
        if hs.contains(w) then dup.add(w)
        hs.add(w)
    next
    dim lst = dup.tolist
    lst.sort
    Join(lst.toarray, " ").dump
    
End Sub