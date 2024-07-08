using Microsoft.AspNetCore.Mvc;

namespace springWishList.Models.DTOs {
    
    [BindProperties]
    public class springDTO {
        public string Name { get; set; }

        public string? Description { get; set; }

        public int? Rating { get; set; } = null;

        public bool HasBeenVisited { get; set; } = false;

        public long RegionId { get; set; }
    }
}
