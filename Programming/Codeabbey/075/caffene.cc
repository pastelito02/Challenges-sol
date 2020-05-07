//Author caffene
void YachtorDicePoker()
{
  int games;
  string line;
  getline(cin, line);
  stringstream(line) >> games;
  for(int loopy = 0; loopy < games; loopy++)
  {
    map<int,int> dice;
    getline(cin, line);
    stringstream ss(line);
    for(int i = 0; i < 5; i++)
    {
      int t;
      ss >> t;
      map<int,int>::iterator it = dice.find(t);
      if(it == dice.end())
      {
        dice.insert(pair<int,int>(t, 1));
      }
      else
      {
        it->second++;
      }
    }
    // check for small straight
    string result = "small-straight";
    bool found = true;
    for(int i = 1; i <= 5; i++)
    {
      if(dice.find(i) == dice.end())
      {
        found = false;
        result = "none";
        break;
      }
    }
    // check for big straight
    if(found == false)
    {
      found = true;
      result = "big-straight";
      for(int i = 2; i <= 6; i++)
      {
        if(dice.find(i) == dice.end())
        {
          found = false;
          result = "none";
          break;
        }
      }
    }
    if(found == false)
    {
      found = true;
      int pair_count = 0;
      bool found_three = false;
      bool found_four = false;
      bool found_yacht = false;

      for(int i = 1; i <= 6; i++)
      {
        map<int,int>::iterator it = dice.find(i);
        if(it != dice.end())
        {
          if(it->second == 2)
            pair_count++;
          if(it->second == 3)
            found_three = true;
          if(it->second == 4)
            found_four = true;
          if(it->second == 5)
            found_yacht = true;
        }
      }
      if(found_yacht)
      {
        result = "yacht";
      }
      if(found_four)
      {
        result = "four";
      }
      if(found_three and pair_count == 1)
      {
        result = "full-house";
      }
      if(found_three and pair_count == 0)
      {
        result = "three";
      }
      if(pair_count == 2)
      {
        result = "two-pairs";
      }
      if(!found_three and pair_count == 1)
      {
        result = "pair";
      }
    }
    cout << result << " ";
  }
}

int main(int argc, const char * argv[])
{
  YachtorDicePoker();
  return 0;
}
