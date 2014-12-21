package com.mycompany.myapp.web.controller;

import java.util.List;
import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.mycompany.myapp.domain.Event;
import com.mycompany.myapp.domain.EventAttendee;
import com.mycompany.myapp.service.CalendarService;

/**
 * Handles requests for the application home page.
 */
@Controller
@RequestMapping(value = "/events")
public class EventController {
	@Autowired
	private CalendarService calendarService;	
	
	@RequestMapping(value = "/form", method = RequestMethod.GET)
	public ModelAndView createEvent(Locale locale, ModelAndView mav) {
		mav.addObject("message", "event를 생성하세요.");
		mav.setViewName("createEvent");
		return mav;
	}

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String events(Locale locale, Model model) {

		Event event =  new Event();
		EventAttendee attendee = new EventAttendee();
		List<Event> events;
		List<EventAttendee> attendees;
		events = this.calendarService.getAllEvents();
		attendees = this.calendarService.getAllEventAttendee();
		model.addAttribute("event", event );
		model.addAttribute("events", events );
		model.addAttribute("attendee", attendee );
		model.addAttribute("attendees", attendees );

		
		return "events";
	}
	
	
}

