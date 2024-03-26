public class Sync
{
    public void Sync(dur T){wait(T);}
    
    public void wait(dur T)
    {
        T - (now % T)=> now;
    }
}
