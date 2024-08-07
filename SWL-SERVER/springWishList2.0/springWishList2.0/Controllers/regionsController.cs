using Microsoft.AspNetCore.Mvc;
using springWishList.Models;
using springWishList.Models.DTOs;
using springWishList.Servise;

namespace springWishList.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class regionsController : Controller {
        private readonly RegionService regionService;

        public regionsController([FromServices] RegionService regionService) {
            this.regionService = regionService;
        }

        [HttpGet("")]
        public IActionResult getAllRegions() {
            try {
                return Ok(regionService.getAllReaions());
            }
            catch (Exception exseption) {
                return NotFound(exseption.Message);
            }
        }

        [HttpGet("{name}/springs")]
        public IActionResult getAllRegionsSprings([FromRoute] string name) {
            try {
                return Ok(regionService.getAllRegionsSpring(name));
            }
            catch (Exception exseption) { 
                return NotFound(exseption.Message);
            }
        }

        [HttpPost]
        public IActionResult addRegion([FromBody] String newRegionName) {
            try {
                regionService.addResion(newRegionName);
                return Ok($"region {newRegionName} was add secsecfuly");
            } catch (Exception exseption) {
                return NotFound(exseption.Message);
            }
        }


        [HttpPut]
        public IActionResult UpdateSpring([FromBody] Region region) {
            try {
                regionService.updateRegion(region);
                return Ok($"spring {region.Name} was updated secsecfuly");
            }
            catch (Exception exseption) {
                return NotFound(exseption.Message);
            }
        }
    }
}
