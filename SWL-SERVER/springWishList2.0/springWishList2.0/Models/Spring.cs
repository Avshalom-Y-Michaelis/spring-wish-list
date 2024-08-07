using Microsoft.AspNetCore.Mvc;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace springWishList.Models {

    [BindProperties, Table("spring")]
    public class Spring {

        [Key, Column("id")]
        public long Id { get; set; }

        [Required, Column("name")]
        public string Name { get; set; }

        [Column("description")]
        public string? Description { get; set; }

        [Column("rating")]
        public int? Rating { get; set; }

        [Required, Column("has_been_visited")]
        public bool HasBeenVisited { get; set; } = false;

        [ForeignKey("RegionId")]
        private Region? Region { get; set; }

        [Column("region_id")]
        public long RegionId { get; set; }

        public Spring() { }

        public Spring(string name, long id, string? description, int? rating, 
                                        bool hasBeenVisited, long regonId) {
            Name = name;
            Id = id;
            Description = description;
            Rating = rating;
            HasBeenVisited = hasBeenVisited;
            RegionId = regonId;
        }
    }
}
