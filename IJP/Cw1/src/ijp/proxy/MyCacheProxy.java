package ijp.proxy;

import java.util.HashMap;

import ijp.Picture;
import ijp.service.Service;
import ijp.service.ServiceFromProperties;
/**
 * implementing a CacheProxy.
 * 
 * @author Zhun YI
 * @version 0.0
 */
public class MyCacheProxy implements Service{
	private Service baseService = null;
	private HashMap<String, Picture> myCache = new HashMap<String,Picture>();
	
	public MyCacheProxy() {
		baseService = new ServiceFromProperties("CacheProxy.base_service");
	}
	public MyCacheProxy(Service baseService){
		this.baseService = baseService;
	}
	/*
	 * Return a picture form base services
	 * @return the request picture
	 * @see ijp.service.Service#getPicture(java.lang.String, int)
	 * @param subject the free-text subject string
     * @param index the index of the matching picture to return
	 */
	@Override
	public Picture getPicture(String subject, int index) {
		Picture picture = null;
		//Combine the subject's name and it's index as a key
		String subjectIndex = subject+Integer.toString(index);
		
		//use the key to find this picture in the cache or put it into the cache
		if(myCache.get(subjectIndex) != null){
			picture = myCache.get(subjectIndex);
		}
		else{
			picture = baseService.getPicture(subject, index);
			myCache.put(subjectIndex, picture);
		}
		return picture;
	}
	/*
	 * Return a textual name for the service.
	 * @return the name of the service
	 * @see ijp.service.Service#serviceName()
	 */
	@Override
	public String serviceName() {
		// TODO Auto-generated method stub
		return "MyCacheProxy";
	}
	
	
}
