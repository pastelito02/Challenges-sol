//Author DTing
var suits = ['Clubs', 'Spades', 'Diamonds', 'Hearts'];
var ranks = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'Jack', 'Queen', 'King', 'Ace'];

input();


function getSuit(v) {
  return suits[Math.floor(v / 13)];
}

function getRank(v) {
  return ranks[v%13];
}

var arr = input().split(' ').map(Number);


output(arr.map(function(v) {
  return [getRank(v), getSuit(v)].join('-of-');
}).join(' '));

