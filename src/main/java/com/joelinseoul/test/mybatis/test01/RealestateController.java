package com.joelinseoul.test.mybatis.test01;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.joelinseoul.test.mybatis.test01.domain.Realestate;
import com.joelinseoul.test.mybatis.test01.service.RealestateService;

@RequestMapping("/mybatis/test01")
@Controller
public class RealestateController {

	@Autowired
	private RealestateService realestateService;
	
	
	@RequestMapping("/realestateInfo")
	@ResponseBody
	public Realestate realestateInfo(@RequestParam("id") int id) {
		Realestate realestateInfo = realestateService.getRealestate(id);
		
		return realestateInfo;
	}
	
	// 문제 2 : 월세를 전달 받고, 해당 월세보다 낮은 월세 매물을 json 으로 response에 담는다.
	
	
	
	// 문제 3 : 면적과 가격을 전달받고, 면적이 더 넓으면서 싼 매물 JSON RESPONSE 에 담는다.
	@RequestMapping("/doubleCondition")
	@ResponseBody
	public List<Realestate> realestateByAreaPrice(@RequestParam("area")int area, @RequestParam("price") int price) {
		 List<Realestate> realestateDouble = realestateService.getRealestateDouble(area, price);
		 
		 return realestateDouble;
	}
	
	@RequestMapping("/add")
	@ResponseBody
	public String addRealestate(@RequestParam("realtorId")int realtorId, @RequestParam("address")String address, @RequestParam("area")int area , @RequestParam("type")String type, @RequestParam("price")int price) {
		int count = realestateService.addRealestate(realtorId,address,area,type,price);
		return count + "건의 매물이 성공적으로 등록되었어요! (등록된 매물 주소 : " + address +")";
	}
	
	@RequestMapping("/addbyobject")
	@ResponseBody
	public String addRealestateByObject(@RequestParam("realtorId")int realtorId, @RequestParam("address")String address, @RequestParam("area")double area , @RequestParam("type")String type, @RequestParam("price")int price) {
		Realestate realestate = new Realestate();
		realestate.setRealtorId(realtorId);
		realestate.setAddress(address);
		realestate.setArea(area);
		realestate.setType(type);
		realestate.setPrice(price);
		
		int count = realestateService.addRealestateByObject(realestate) ; 
		return count + "건의 매물이 성공적으로 등록되었어요! (등록된 매물 주소 : " + realestate.getAddress() +")";
	}
	
	@RequestMapping("/edit")
	@ResponseBody
	public String editRealestate(@RequestParam("id")int id, @RequestParam("type")String type, @RequestParam("price")int price) {
		String targetEditAddress = realestateService.getAddressById(id);
		int count = realestateService.updateRealestate(id, type, price);
		return targetEditAddress + " 의 매물, " + count + "건이 수정되었어요.";
	}
	
	@RequestMapping("/delete")
	@ResponseBody
	public String deleteRealestate(@RequestParam("id")int id) {
		String targetEditAddress = realestateService.getAddressById(id);
		int count = realestateService.deleteRealestate(id);
		return targetEditAddress + " 의 매물, " + count + "건이 삭제되었어요.";
	}
	
}
