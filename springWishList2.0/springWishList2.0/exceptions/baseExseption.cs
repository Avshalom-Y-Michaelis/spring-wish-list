namespace springWishList.exceptions {
    public class baseExseption : Exception {
        public baseExseption(string message) : base($"somting went worng :( => {message}") { }
    }
}
