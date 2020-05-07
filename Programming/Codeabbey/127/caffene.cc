//Author caffene
void anagrams()
{
  ifstream fin;
  vector<string> data;
  string line;
  int tests;
  fin.open("words.txt", ifstream::in);
  while(!fin.eof())
  {
    getline(fin, line);
    data.push_back(line);
  }
  fin.close();
  getline(cin, line);
  stringstream(line) >> tests;
  for(int i = 0; i < tests; i++)
  {
    int anagram = 0;
    getline(cin, line);
    for(auto it : data)
    {
      string s = it;
      string temp1 = line;
      string temp2 = s;

      if(s.length() == line.length() && s != line)
      {
        sort(temp1.begin(), temp1.end());
        sort(temp2.begin(), temp2.end());
        if(temp1 == temp2)
        {
          anagram++;
        }
      }
    }
    if(anagram > 0)
      cout << anagram << " ";
  }

}

int main(int argc, const char * argv[])
{
  anagrams();

  return 0;
}
