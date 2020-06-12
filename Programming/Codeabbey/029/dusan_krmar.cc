//Author dusan_krmar
#include <iostream>
#include <fstream>
using namespace std;

int main()
{
    ifstream unos_podataka;
    unos_podataka.open("podaci.txt");
    
    int niz[19][2];//za ovaj zadatak mora se napraviti dvodimenzionalni niz
    
    for(int i=0; i<19; i++)
    {
        unos_podataka>>niz[i][0];//prva kolona tog niza bice ovi uneti brojevi 
    }
    int k=1;
    niz[0][1]=k;
    
    
    while(k<=19)//druga kolona bice redni broj broja (redni broj niza plus 1----niz od 0 pocinje, a ne od 1!!!!!) 
    {
        
        niz[k][1]=k+1;
        k++;
    }
    
    //niz se zatim sortira, ali samo prva kolona
    
    for(int i=0; i<19; i++)
    {
        for (int j=0; j<19-i; j++)
        {
            if(niz[j][0]>niz[j+1][0])
            {
                int a;//sortiraju se clanovi prve kolone po velicini
                a=niz[j][0];
                niz[j][0]=niz[j+1][0];
                niz[j+1][0]=a;
                int b;//ne smeju se zaboraviti sorirati i clanovi druge kolone u tom slucaju, ako se ne sortiraju onda ce rezulta biti 1, 2, 3, 4, 5....
                b=niz[j][1];
                niz[j][1]=niz[j+1][1];
                niz[j+1][1]=b;
            }
        }
    }
    
    for(int i=0; i<19; i++)
    {
        cout<<niz[i][1]<<endl;//ispisuje se samo druga kolona tj pocetni indeks clana
    }
    
    
    return 0;
}