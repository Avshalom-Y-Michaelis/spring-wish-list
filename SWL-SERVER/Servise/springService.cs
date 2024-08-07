using springWishList.Conection;
using springWishList.Models.DTOs;
using springWishList.Models;
using springWishList.exceptions.spring;

namespace springWishList.Servise {

    public class springService {
        private readonly DBconection _DBconection;

        public springService(DBconection DBconection) {
            _DBconection = DBconection;
        }

        public Spring getSpringById(long id) {
            Spring? spring = _DBconection.Spring.Find(id);
            _ = spring ?? throw new springNotFoundException($"id of {id}");

            return spring;
        }

        public void addSpring(springDTO newSprig) {
            _DBconection.Add(new Spring(newSprig.Name, 0, newSprig.Description,
                    newSprig.Rating, newSprig.HasBeenVisited, newSprig.RegionId));
            _DBconection.SaveChanges();
        }

        public void updateSpring(Spring newSprig) {
            _DBconection.Update(newSprig);
            _DBconection.SaveChanges();
        }


        public List<Spring> getAllSrpingByRegionId(long regionId) {
            return _DBconection.Spring.Where(spring =>
                            spring.RegionId == regionId).ToList();
        }
    }
}
