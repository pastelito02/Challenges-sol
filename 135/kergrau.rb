#Author kergrau
answer = ''
union = ''
letter = ''
sequence = ''
File.open('DATA135.lst', 'r') do |file|
  while line = file.gets
    line.strip.split('').each do |letter|

      case letter
        when ' '
          sequence = '11'
        when 't'
          sequence = '1001'
        when 'n'
          sequence = '10000'
        when 's'
          sequence = '0101'
        when 'r'
          sequence = '01000'
        when 'd'
          sequence = '00101'
        when '!'
          sequence = '001000'
        when 'c'
          sequence = '000101'
        when 'm'
          sequence = '000011'
        when 'g'
          sequence = '0000100'
        when 'b'
          sequence = '0000010'
        when 'v'
          sequence = '00000001'
        when 'k'
          sequence = '0000000001'
        when 'q'
          sequence = '000000000001'
        when 'e'
          sequence = '101'
        when 'o'
          sequence = '10001'
        when 'a'
          sequence = '011'
        when 'i'
          sequence = '01001'
        when 'h'
          sequence = '0011'
        when 'l'
          sequence = '001001'
        when 'u'
          sequence = '00011'
        when 'f'
          sequence = '000100'
        when 'p'
          sequence = '0000101'
        when 'w'
          sequence = '0000011'
        when 'y'
          sequence = '0000001'
        when 'j'
          sequence = '000000001'
        when 'x'
          sequence = '00000000001'
        when 'z'
         sequence = '000000000000'
      end
      union << sequence
    end

    union.chars.each_slice(8) do |e|
      substring = e.join('')
      if substring.length < 8
        #fill with 0 to rigth until have 8 chars
        substring = substring.ljust(8, '0')
      end
      answer = substring.to_i(2).to_s(16)
      if answer.length < 2
        #fill with 0 to left until have 2 chars
        answer = answer.rjust(2, '0')
      end
      puts answer.upcase
    end
  end
end
