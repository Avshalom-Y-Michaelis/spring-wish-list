namespace springWishList.exceptions.spring {
    public class springNotFoundException : baseExseption {
        public springNotFoundException(string message) : base($"spring with {message} was not found") { }

    }
}
