//Author JMontanoS
let length = input()
for(let i = 0; i < length; i += 1) {
  output( (input().match(/[aeiouy]/g).length) + ' ');
}
