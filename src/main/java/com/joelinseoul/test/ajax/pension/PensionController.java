package com.joelinseoul.test.ajax.pension;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.joelinseoul.test.ajax.pension.domain.Pension;
import com.joelinseoul.test.ajax.pension.service.PensionService;

@Controller
@RequestMapping("/pension")
public class PensionController {

	@Autowired
	private PensionService pensionService;
	
	@GetMapping("/home")
	public String pensionHome(){
		return "ajax/pension/homePage";
	}
	
	@GetMapping("/reservation_list")
	public String reservationListPage(Model model) {
		
		List<Pension> getReservationList = pensionService.getReseravationList();
		
		model.addAttribute("reservationListMd", getReservationList);
		
		return "ajax/pension/reservationList";
	}
	
	@GetMapping("/reservation/delete")
	@ResponseBody
	public Map<String,String> deleteReservation(@RequestParam("id")int id) {
		
		Map<String,String> result = new HashMap<>();
		
		int count = pensionService.deleteReservation(id);
		if(count == 1) {
			result.put("result", "success");
		} else result.put("result", "fail");
		
		return result;
	}
	
	@GetMapping("/reservation")
	public String reservationPage() {
		return "ajax/pension/reservation";
	}
	
	@GetMapping("/reservation/add")
	@ResponseBody
	public Map<String,String> addReservation(
			@RequestParam("name") String name
			,@RequestParam("date") @DateTimeFormat(pattern="yyyy-M-dd")Date date
			,@RequestParam("day") int day
			,@RequestParam("headcount") int headcount
			,@RequestParam("ph") String phoneNumber
			){
		Map<String,String> result = new HashMap<>();
		int count = pensionService.addReservation(name, date, day, headcount, phoneNumber);
		if(count == 1) {
			result.put("result","success");
		} else result.put("result","fail");
		return result;
	}

	@GetMapping("/reservation/search")
	@ResponseBody
	public List<Map<String,Object>> getReservationInfoByNameAndPhoneNumber(
			@RequestParam("name") String name
			,@RequestParam("ph") String phoneNumber
			) {
		Pension getInfo = pensionService.getReservationByNameAndPhoneNumber(name, phoneNumber);
		
		List<Map<String,Object>> infoList = new ArrayList<>();
		Map<String, Object> infoMap = new HashMap<>();
		
		if(getInfo == null) {
			infoMap.put("result",0);
			infoList.add(infoMap);
			return infoList;
		} else {
			infoMap.put("result",1);
			infoList.add(infoMap);
			infoMap = new HashMap<>();
			infoMap.put("name", getInfo.getName());
			infoMap.put("date",getInfo.getDate());
			infoMap.put("day",getInfo.getDay());
			infoMap.put("headCount",getInfo.getHeadcount());
			infoMap.put("state",getInfo.getState());
			infoList.add(infoMap);
			return infoList;
		}
	}

}
