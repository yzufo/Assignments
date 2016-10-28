// IJP Assignment 1, Version 6.1.0, 05 Oct 2016
package ijp.test;

import static org.junit.Assert.*;
import java.awt.image.BufferedImage;

import org.junit.Test;

import ijp.Picture;
import ijp.proxy.BrokenCacheProxy;
import ijp.proxy.CacheProxy;
import ijp.proxy.MyCacheProxy;
import ijp.service.Service;

/**
 * Testing a cache proxy for the PictureViewer application.
 * 
 * @author Zhun Yi
 * @version 0.0
 */
public class MyCacheProxyTest implements Service {
	
	/**
	 * Test that requests for the same subject and index return the same image.
	 */
	@Test
	public void equalityTest() {

		Service proxy = new BrokenCacheProxy(this);
		Picture firstPicture = proxy.getPicture("equalityTest",33);
		Picture secondPicture = proxy.getPicture("equalityTest",33);

		assertTrue(
				"different picture returned for same subject (and index)",
				firstPicture.equals(secondPicture));
	}
	/**
	 * ErrorCode A
	 * Test that return picture has the same index
	 */
	@Test
	public void indexText() {
		Service proxy = new BrokenCacheProxy(this);
		Picture picture = proxy.getPicture("indexTest",22);

		assertTrue(
				"different index returned from request",
				picture.index() == 22);
	}
	/**
	 * ErrorCode B
	 * Test Service runs correctly
	 */
	@Test
	public void connectTest(){
		Service proxy = new BrokenCacheProxy(this);
		Picture picture = proxy.getPicture("connectTest",22);
		String source = picture.source();
		//if source is NoService, it#s an error
		assertFalse(
				"No Service Error",
				source == "NoService");
	}
	/**
	 * ErrorCode C
	 * Test cache can save correct picture
	 */
		@Test
		public void correctCacheTest(){
			Service proxy = new BrokenCacheProxy(this);
			//first get picture, it should be save in the cache
			proxy.getPicture("correctCacheTest",22);
			//get a different picture
			Picture picture2 = proxy.getPicture("correctCacheTest2",22);
			//get the first picture again
			Picture picture3 = proxy.getPicture("correctCacheTest",22);
			//if cache saved the second picture as the first picture, it's an error
			assertFalse(
					"It save next picture in cache, not current one",
					picture2.equals(picture3));
		}
		/**
		 * ErrorCode D
		 * Test the "cannot divide by zero error"
		 */
		@Test
		public void zeroDividTest(){
			Service proxy = new BrokenCacheProxy(this);
			Picture picture = new Picture();
			
			//get one picture 20 times to find the error
			for (int i = 0; i < 20; i++) {
				try {
					picture = proxy.getPicture("zeroDividTest",2);
				} catch (Exception e) {
					String errormessage = e.toString();
					if(errormessage.indexOf("zero")!=0){
						assertTrue(
								"/ by zero",
								false);
					}
				}
			}
		}
	/**
	 * Return a picture from the simulated service.
	 * This service simply returns an empty picture every time that it called.
	 * Note that a <em>different</em> object is returned each time, even if the
	 * subject and index are the same.
	 *
	 * @param subject the requested subject
	 * @param index the index of the picture within all pictures for the requested topic
	 *
	 * @return the picture
	 */
	@Override
	public Picture getPicture(String subject, int index) {
		return new Picture((BufferedImage)null, subject ,serviceName(), index);
	}
	
	/**
	 * Return a textual name to identify the simulated service.
	 *
	 * @return the name of the service ("cacheProxyTest")
	 */
	@Override
	public String serviceName() {
		return "MyCacheProxyTest";
	}
}