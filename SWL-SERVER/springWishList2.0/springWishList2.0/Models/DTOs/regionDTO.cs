using Microsoft.AspNetCore.Mvc;
using springWishList2._0.Models;
using System.Text.Json.Serialization;

namespace springWishList.Models.DTOs {

    [BindProperties]
    public class regionDTO {
        public long Id { get; set; }
        public string Name { get; set; }
        public RegionSpringStatiscis SpringStatistics { get; set; } = new RegionSpringStatiscis();

        public regionDTO(Region region, List<Spring> springList) { 
            Id = region.Id;
            Name = region.Name;

            SpringStatistics.SpringNum = springList.Count;
            SpringStatistics.springsVisited = springList.Where(spring => 
            spring.HasBeenVisited).ToList().Count();
        }
    }
}
