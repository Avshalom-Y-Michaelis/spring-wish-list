using Microsoft.AspNetCore.Mvc;
using springWishList.Conection;
using springWishList.exceptions.region;
using springWishList.Models;
using springWishList.Models.DTOs;

namespace springWishList.Servise {
    public class RegionService {
        private readonly DBconection _DBconection;
        private readonly springService _springService;

        public RegionService(DBconection DBconection, [FromServices] springService springService) {
            _DBconection = DBconection;
            _springService = springService;
        }

        public List<regionDTO> getAllReaions() {

            List<Region>? region = _DBconection.Region.ToList<Region>();
            List<regionDTO> regionsDTO = region.Select(region => new regionDTO(region, getAllRegionsSpring(region.Name))).ToList();
            _ = region ?? throw new regionNotFoundException("no regions");

            return regionsDTO;
        }

        public Region getRegionByName(string name) {
            Region? region = _DBconection.Region.Where(region => region.Name == name).FirstOrDefault();
            _ = region ?? throw new regionNotFoundException($"region with name: {name}");
            
            return region;
        }

        public List<Spring> getAllRegionsSpring(string regionName) {
            Region region = getRegionByName(regionName);
            return _springService.getAllSrpingByRegionId(region.Id);
        }

        public void addResion(string newRegionName) {
            _DBconection.Add(new Region(newRegionName, 0));
            _DBconection.SaveChanges();
        }

        public void updateRegion(Region Region) {
            _DBconection.Update(Region);
            _DBconection.SaveChanges();
        }

    }
}
