#Author john_delacrauss
#!/usr/bin/ruby

def exteuclidian(x:x,y:y)
    # This form of calculating the modular inverse was my implementation of the Modular inverse task
    # So i'm recycling it.
    sprev = 1
    scur  = 0

    tprev = 0
    tcur  = 1
    r = x%y
    while r != 0
        q,r = x/y,x%y
        snext = sprev - q * scur
        tnext = tprev - q * tcur
        x = y
        y = r
        sprev = scur
        tprev = tcur
        scur = snext
        tcur = tnext
        r = x%y            
    end
    a = scur
    b = tcur
    a
end


def rsadecryptor(p:0,q:0,c:0)
    e = 65537
    #e = 5
    # Basic RSA deffinition:
    # We know that n = p*q
    # phi_n = (p-1)*(q-1)
    # we have e = 65537
    # For finding d we need to calculate the modular inverse of e
    # The formula is: d = (1/e) mod(phi_n)
    # But thats the thing, in my pursuit of understanding basic RSA i need to calculate the modular inverse
    #After hitting myhead against the keyboard, researching for some math formulas i came to the conclusion
    # that i had 2 choices:bruteforce it, or aplying euclidian extended algorithm.
    # i choose the second option, but not in my first try.
    # I had to solve Extended euclidian algorithm and Modular inverse from codeabbey
    # And finally i could learn how to calculate that inv modulo...
    
    n = p*q
    #optional debugging option
    #puts "N is: #{n}"
    phi_n = (p-1)*(q-1)
    #optional debugging option
    #puts "phi_n is: #{phi_n}"
    d = exteuclidian(x:e,y:phi_n)
    if d < 0
        d = d%(phi_n)
    end
    #optional debugging option
    #teste = (e*d)%(phi_n)
    #puts "Teste de unimidad: #{teste}"

    m = c.pow(d,n)
    #optional debugging option
    #puts "M decrypted: #{m}" 
    msg = ""
    m = m.to_s
    (0..m.length).step(2).each do |i|
        a= m[i..i+1]
        if a == "00"
            break
        end
        msg <<  (m[i]+m[i+1]).to_i.chr
    end
    #This is the message decrypted and decoded
    print "#{msg}"
end



#input_data = "30762542250301270692051460539586166927291732754961
#29927402397991286489627837734179186385188296382227
#424236952206057066872700453503661773567827006571091351397488406910437574827532103275742945321419387"

input_data = "64495327731887693539738558691066839103388567300449
53542885039615245271174355315623704334284773568199
1386543408370242216525890415702817180262616289501191981829038175341410783241142665899095474477780594"


p,q,c = input_data.split()[0].to_i,input_data.split()[1].to_i,input_data.split()[2].to_i
#p,q,c = 3,7,17
rsadecryptor(p:p,q:q,c:c)