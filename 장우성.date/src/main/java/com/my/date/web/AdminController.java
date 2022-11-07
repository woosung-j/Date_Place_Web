package com.my.date.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.my.date.domain.Place;
import com.my.date.service.PlaceService;

@RestController("placeController")
@RequestMapping("admin")
public class AdminController {
	@Autowired private PlaceService placeService;
	
	@GetMapping("place")
	public ModelAndView main(ModelAndView mv) {
		mv.setViewName("place/placelist");
		return mv;
	}
	
	@GetMapping("/placelist")
	public List<Place> getPlaces() {
		return placeService.getPlaces();
	}
	
	@PostMapping("/add")
	public void addPlace(@RequestBody Place place) {
		placeService.addPlace(place);
	}
	
	@PutMapping("/fix")
	public void fixPlace(@RequestBody Place place) {
		placeService.fixPlace(place);
	}
	
	@DeleteMapping("/del/{placeId}")
	public void delPlace(@PathVariable int placeId) {
		placeService.delPlace(placeId);
	}
}
