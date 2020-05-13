#Author Unihedron
d=[*$<][1].split.map.with_index{|x,y|[x.to_i,y]}.sort
r=[]
a,b,c=1,1,2
(a,b=b,b+a
d.take_while{|x,y|a>x}.each.with_index.each_with_object([]){|((x,y),i),m|(m<<i)&&r[y]=c if a%x==0}.reverse.each{|x|d.delete_at x}
c+=1)while d[0]
puts r
