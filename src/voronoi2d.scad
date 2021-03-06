/**
* voronoi2d.scad
*
* @copyright Justin Lin, 2019
* @license https://opensource.org/licenses/lgpl-3.0.html
*
* @see https://openhome.cc/eGossip/OpenSCAD/lib2x-voronoi2d.html
*
**/

module voronoi2d(points, spacing = 1, r = 0, delta = 0, chamfer = false, region_type = "square") {
    echo("<b><i>voronoi2d</i> is deprecated: use <i>voronoi/vrn2_from</i> instead.</b>");

    xs = [for(p = points) p[0]];
    ys = [for(p = points) abs(p[1])];

    region_size = max([(max(xs) -  min(xs) / 2), (max(ys) -  min(ys)) / 2]);    
    half_region_size = 0.5 * region_size; 
    offset_leng = spacing * 0.5 + half_region_size;

    function normalize(v) = v / norm(v);
    
    module region(pt) {
        intersection_for(p = points) {
            if(pt != p) {
                v = p - pt;
                translate((pt + p) / 2 - normalize(v) * offset_leng)
                rotate(atan2(v[1], v[0]))
                    children();
            }
        }
    }    

    module offseted_region(pt) {
        if(r != 0) {
            offset(r) 
            region(pt) 
                children();
        }
        else {
            offset(delta = delta, chamfer = chamfer) 
            region(pt) 
                children();
        }     
    }
    
    for(p = points) {	
        if(region_type == "square") {
            offseted_region(p)
                square(region_size, center = true);
        }
        else {
            offseted_region(p)
                circle(half_region_size);
        }
    }
}