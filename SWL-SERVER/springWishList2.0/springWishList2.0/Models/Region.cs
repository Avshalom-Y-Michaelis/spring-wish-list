using Microsoft.AspNetCore.Mvc;
using springWishList.Models.DTOs;
using springWishList2._0.Models;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace springWishList.Models {

    [BindProperties, Table("region")]
    public class Region {

        [Key, Column("id")]
        public long Id { get; set; }

        [Required, Column("name")]
        public string Name { get; set; }        

        public Region() {}

        public Region(string name, long id) {
            Name = name;
            Id = id;
        }
    }
}
