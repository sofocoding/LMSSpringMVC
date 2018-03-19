package com.gcit.lms;

import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.gcit.lms.service.AdminBranchService;

@Controller
@RequestMapping("/branches")
public class BranchController {
	@Autowired 
	AdminBranchService adminBranchService;
	
	@RequestMapping(value = "/viewbranches", method = RequestMethod.GET)
	public String viewAuthors(Model model) throws SQLException {
		model.addAttribute("branches", adminBranchService.getAllBranches(1, null));
		Integer branchCount = adminBranchService.getBranchesCount();
		int pages = 0;
		pages = (int) Math.ceil(1.0 * branchCount / 10);
		model.addAttribute("pages", pages);
		return "viewbranches";
	}
}
