package com.techelevator.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.techelevator.model.Forecast;
import com.techelevator.model.ForecastDao;
import com.techelevator.model.Park;
import com.techelevator.model.ParkDao;
import com.techelevator.model.Survey;
import com.techelevator.model.SurveyDao;
import com.techelevator.model.SurveyResult;

@Controller
@SessionAttributes("isFahrenheit")

public class NPGeekController {
	@Autowired
	ParkDao parkDao;
	@Autowired
	SurveyDao surveyDao;
	@Autowired
	ForecastDao forecastDao;

	@RequestMapping(path = "/", method = RequestMethod.GET)
	public String displayHomePage(HttpServletRequest request) {
		List<Park> allParks = parkDao.getAllParks();
		request.setAttribute("parks", allParks);
		return "npghome";
	}

	@RequestMapping(path = "/parkDetail", method = RequestMethod.GET)
	public String displayParkDetail(HttpServletRequest request, ModelMap model) {
		String code = request.getParameter("chosenPark");
		Park thePark = parkDao.getSelectedParkInfo(code);
		request.setAttribute("parkInfo", thePark);
		List<Forecast> theForecast = forecastDao.getForecastByPark(code);
		request.setAttribute("parkForecast", theForecast);
		
		if(!model.containsAttribute("isFahrenheit")) {
			model.addAttribute("isFahrenheit", true);
		}

		return "parkDetail";
	}
	
	@RequestMapping(path="/parkDetail", method = RequestMethod.POST)
	public String displayParkDetailCelsius(@RequestParam String unit,
										   @RequestParam String parkCode,
										   RedirectAttributes redirectAttrs,
										   ModelMap model) {
		if(unit.equals("celsius")) {
			model.addAttribute("isFahrenheit", false);
		} else {
			model.addAttribute("isFahrenheit", true);
		}
		
		redirectAttrs.addAttribute("chosenPark", parkCode);
		
		return "redirect:/parkDetail";
	}
	

	@RequestMapping(path = "/surveyInput", method = RequestMethod.GET)
	public String displaySurveyInput(Model surveyHolder) {
		if (!surveyHolder.containsAttribute("survey")) {
			surveyHolder.addAttribute("survey", new Survey());
		}
		return "surveyInput";
	}

	@RequestMapping(path = "/surveyInput", method = RequestMethod.POST)
	public String processSurveyInput(@Valid @ModelAttribute("survey") Survey survey, BindingResult result,
			RedirectAttributes redirectAttrs) {
		redirectAttrs.addFlashAttribute("survey", survey);
		if (result.hasErrors()) {
			redirectAttrs.addFlashAttribute(BindingResult.MODEL_KEY_PREFIX + "survey", result);
			return "redirect:/surveyInput";
		}

		surveyDao.saveSurvey(survey);
		return "redirect:/surveyResult";
	}

	@RequestMapping(path = "/surveyResult", method = RequestMethod.GET)
	public String displaySurveyResult(HttpServletRequest request) {
		List<SurveyResult> results = surveyDao.getSurveyResults();
		request.setAttribute("results", results);
		return "surveyResult";
	}
}
