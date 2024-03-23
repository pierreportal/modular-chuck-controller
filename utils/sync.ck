public class Sync
{
    public Sync(dur T){wait(T);}
    
    public wait(dur T)
    {
        T - (now % T)=> now;
    }
}
