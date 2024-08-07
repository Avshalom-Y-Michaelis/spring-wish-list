namespace springWishList.exceptions.region
{
    public class regionNotFoundException : baseExseption
    {
        public regionNotFoundException(string message) : base($"{message} was not found") { }
    }
}
