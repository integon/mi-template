package ch.integon.example;

import org.apache.synapse.MessageContext;
import org.apache.synapse.commons.json.JsonUtil;
import org.apache.synapse.core.axis2.Axis2MessageContext;
import org.apache.synapse.mediators.AbstractMediator;

import java.io.IOException;

import org.apache.axis2.AxisFault;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.json.JSONObject;


/**
 * 
 * @author AH Integon GmbH
 *
 */
public class EXAMPLEMediator extends AbstractMediator
{
	//logger defined as ExampleMediator
	protected static final Log logger = LogFactory.getLog(EXAMPLEMediator.class);

	private String action;

	/**
	 * WSO2 Mediator class to show how an Custom Mediator is made
	 * 
	 * @throws IOException
	 */
	public EXAMPLEMediator()
	{	

	}

	/**
	 * 	mediate message
	 */
	@Override
	public boolean mediate(MessageContext synCtx)
	{
		 
		if(action == null)
		{
			logger.debug("No action defined. Following \"handleException\" procedure");
			handleException("No action set for Mediator: EXAMPLEMediator!", synCtx);
		}
		
		logger.debug("\"action\" submitted: " + action);
		
		
		//logger write somthing on console and return json
		logger.info("Hello EXAMPLE from Custom Mediator! Returning a json: {\"hello\":\"world\"}");
		JSONObject obj = new JSONObject("{\"hello\":\"world\"}");
		createJsonPayload(obj, synCtx);
		
		return true;
	}

	/**
	 * create a Json Payload and write it to the message context
	 * 
	 * @param obj	the json object that is written to the message context
	 * @param ctx	the context in which the json is written as payload
	 */
	private void createJsonPayload(JSONObject obj, MessageContext ctx)
	{
		org.apache.axis2.context.MessageContext axis2MessageContext = ((Axis2MessageContext) ctx).getAxis2MessageContext();
	
		try
		{
			logger.debug("Creating json payload in axis2MessageContext: " + obj.toString());
			logger.debug("Axis2MessageContext: " + axis2MessageContext.toString());
			JsonUtil.getNewJsonPayload(axis2MessageContext, obj.toString(), true, true);
		} catch (AxisFault e)
		{
			logger.debug("fallen into exception: " + e.getClass().toGenericString());
			e.printStackTrace();
			handleException("unable to create json payload!", e, ctx);
		}
	}
	

	// abstract 
	public String getType()
	{
		return null;
	}

	// abstract
	public void setTraceState(int traceState)
	{
		traceState = 0;
	}

	// abstract
	public int getTraceState()
	{
		return 0;
	}

	// Class Mediator Injection
	public String getAction()
	{
		return action;
	}

	// Class Mediator Injection
	public void setAction(String action)
	{
		this.action = action;
	}
}
