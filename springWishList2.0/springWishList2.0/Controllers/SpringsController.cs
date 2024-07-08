using Microsoft.AspNetCore.Mvc;
using springWishList.exceptions.spring;
using springWishList.Models;
using springWishList.Models.DTOs;
using springWishList.Servise;

namespace springWishList.Controllers {
    [ApiController]
    [Route("[controller]")]
    public class SpringsController : ControllerBase {

        private readonly springService _springService;

        public SpringsController([FromServices] springService springService) {
            _springService = springService;
        }

        [HttpGet("{id}")]
        public IActionResult getSpring([FromRoute] long id) {
            try {
                return Ok(_springService.getSpringById(id));
            }
            catch (Exception exseption) {
                return NotFound(exseption.Message);
            }
        }

        [HttpPost]
        public IActionResult addSpring([FromBody] springDTO newSpring) {
            try {
                _springService.addSpring(newSpring);
                return Ok($"spring {newSpring.Name} was add secsecfuly");
            }
            catch (Exception exseption) {
                return NotFound(exseption.Message);
            }
        }

        [HttpPut]
        public IActionResult UpdateSpring([FromBody] Spring newSpring) {
            try {
                _springService.updateSpring(newSpring);
                return Ok($"spring {newSpring.Name} was updated secsecfuly");
            }
            catch (Exception exseption) {
                return NotFound(exseption.Message);
            }
        }
    }
}
