// IJP Assignment 1, Version 6.1.0, 05 Oct 2016
package ijp.controller;
import java.util.List;
import java.util.Arrays;
import java.util.HashMap;

import ijp.Picture;
import ijp.proxy.RetryProxy;
import ijp.service.Service;
import ijp.service.ServiceFromProperties;
import ijp.utils.Properties;
import ijp.view.View;
import ijp.view.ViewFromProperties;

/**
 * Mycontroller for the PictureViewer application.
 * 
 * @author Zhun YI
 * @version 0.0
 */
public class MyController implements Controller {

	private View view;
	private Service service;
	private Service baseService = null;
	private HashMap<Integer, String> munroName;

	/**
	 * Start the controller.
	 */
	public void start() {

		// create the view and the service objects
		view = new ViewFromProperties(this);
		service = new ServiceFromProperties();


		// get the subject's names from Properties and put them into the list
		munroName = new HashMap<Integer,String>();
		List<String> sub = Arrays.asList(Properties.get("subjects").split(","));
		sub.forEach(str->addSubject(str.trim()));
		
		// start the interface
		view.start();
		
	}
	/**
	 * Add subjects name to the list
	 * @param name the subject's name
	 */

	public void addSubject(String name) {
		munroName.put(view.addSelection(name),name);
	}
	/**
	 * Handle the specified selection from the interface.
	 *
	 * @param selectionID the id of the selected item
	 */
	public void select(int selectionID) {
		

		Picture picture = new Picture();
		// get the picture's name from the list
		// create a picture corresponding to the selectionID 
		picture = service.getPicture(munroName.get(selectionID), 1);
		
		view.showPicture(picture);
	}
}
