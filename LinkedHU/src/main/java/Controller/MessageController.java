package Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.Map.Entry;
import java.util.TreeMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;

import Interfaces.IService;
import Model.SystemService;
import Model.Message;
import Model.User;
import general.MyConstants;

@WebServlet("/MessageController")
public class MessageController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private HttpSession session;
	private IService service = new SystemService();
       
    public MessageController() {
        super();
       
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// Post Request Get design pattern.
		request.getRequestDispatcher("MyMessages.jsp").forward(request, response);	
		}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		session = request.getSession();
		
		String operation = request.getParameter("operation");
		User currentUser = ((User)session.getAttribute("currentUser"));
		
		if(operation.equals(MyConstants.OPP_LOGIN)) {
			List<Message> allUserMessages = service.fetchUserMessages(currentUser.getUserID());
			viewInbox(currentUser,allUserMessages);
		}
		else if(operation.equals(MyConstants.OPP_VIEW_INBOX)) {
			response.sendRedirect("MessageController");
		}
		
		
		else if(operation.equals(MyConstants.OPP_SEND_MESSAGE)) {
			String receiverID = request.getParameter("receiverID");
			String messageSubject = request.getParameter("messageSubject");
			String messageText = request.getParameter("messageText");
			
			boolean control = sendMessage(currentUser,Integer.parseInt(receiverID),messageSubject,messageText,request);
			
			Gson gson = new Gson(); 
	        JsonObject jsonObject = new JsonObject();
	        JsonElement firstElement = gson.toJsonTree((Message)request.getAttribute("lastCreated"));
	        JsonElement secondElement = gson.toJsonTree((User)request.getAttribute("receiver"));
	        jsonObject.add("messageInfo",firstElement);
	        jsonObject.add("authorInfo",secondElement);
	        request.removeAttribute("lastCreated");
	        request.removeAttribute("receiver");
	        response.setContentType("text/html");
	        response.setHeader("Cache-control", "no-cache, no-store");
	        response.setHeader("Pragma", "no-cache");
	        response.setHeader("Expires", "-1");
	        response.setHeader("Access-Control-Allow-Origin", "*");
	        response.setHeader("Access-Control-Allow-Methods", "POST");
	        response.setHeader("Access-Control-Allow-Headers", "Content-Type");
	        response.setHeader("Access-Control-Max-Age", "86400");
	        
	        PrintWriter out = response.getWriter();
			out.println(jsonObject);
		}
		else if(operation.equals(MyConstants.OPP_DELETE_MESSAGE)) {
			int deletedMessageID = Integer.parseInt(request.getParameter("deletedMessage"));
			String userRole = request.getParameter("currentUserRole");
			deleteMessage(currentUser,deletedMessageID,userRole);
			System.out.println(deletedMessageID+" " + userRole);
		}
		
	}
	
	private boolean sendMessage(User user,int receiverID,String messageSubject,String messageText,HttpServletRequest request) {
		
		Message newMessage = new Message();
		newMessage.setSenderID(((User)session.getAttribute("currentUser")).getUserID());
		newMessage.setReceiverID(receiverID);
		newMessage.setMessageTopic(messageSubject);
		newMessage.setText(messageText);
		
		if(service.createMessage(newMessage)) {
			Message lastCreatedMessage = service.readMessage(service.getLastMessageID());
			User receiver =  service.readUser(receiverID);
			lastCreatedMessage.getFormattedDate();
			lastCreatedMessage.getFormattedDateWithoutHours();
			request.setAttribute("lastCreated",lastCreatedMessage);
			request.setAttribute("receiver",receiver);
			user.getMessages().put(lastCreatedMessage,receiver);
			session.setAttribute("currentUser",user);
			return true;
		}
		return false;
	}
	private boolean viewInbox(User user,List<Message> allMessages) {
		TreeMap<Message,User> inboxMessages = new TreeMap<Message,User>();
		try 
		{
			for(Message message : allMessages) 
			{
				if(message.getReceiverID() == user.getUserID() && message.getDeletionStatus() != MyConstants.CODE_DELETEDMESSAGE_BY_RECEIVER)
				{
					user.getMessages().put(message,service.readUser(message.getSenderID()));
				}
			}
			viewOutbox(user,allMessages);
			List<User> allSystemUsers = service.fetchAllUsers();
			session.setAttribute("allSystemUsers",allSystemUsers);
			return true;
			
		}
		catch(Exception e) {
			e.printStackTrace();
			return false;
		}
		
	}
	
	private boolean viewOutbox(User user,List<Message> allMessages) {
		try 
		{
			for(Message message : allMessages) 
			{
				if(message.getSenderID() == user.getUserID() && message.getDeletionStatus() != MyConstants.CODE_DELETEDMESSAGE_BY_SENDER)
				{
					user.getMessages().put(message,service.readUser(message.getReceiverID()));
				}
			}
			session.setAttribute("currentUser",user);
			session.setAttribute("otherUser",user);
			return true;
			
		}
		catch(Exception e) {
			e.printStackTrace();
			return false;
		}

	}
	private boolean deleteMessage(User user,int messageID,String userRole) {
		Message message = service.readMessage(messageID);
		int operation = 0;
		switch(userRole) {
			case "sender":
				if(message.getDeletionStatus() == MyConstants.CODE_UNDELETED_MESSAGE) {
					message.setDeletionStatus(MyConstants.CODE_DELETEDMESSAGE_BY_SENDER);
					service.updateMessage(message);
					operation = 0;
					break;
				}
				else if(message.getDeletionStatus() == MyConstants.CODE_DELETEDMESSAGE_BY_RECEIVER) {
					service.deleteMessage(message);
					operation = 1;
					break;
				}
			case "receiver":
				if(message.getDeletionStatus() == MyConstants.CODE_UNDELETED_MESSAGE) {
					message.setDeletionStatus(MyConstants.CODE_DELETEDMESSAGE_BY_RECEIVER);
					service.updateMessage(message);
					operation = 0;
					break;
				}
				else if(message.getDeletionStatus() == MyConstants.CODE_DELETEDMESSAGE_BY_SENDER) {
					service.deleteMessage(message);
					operation = 1;
					break;
				}
		}
		
		TreeMap<Message,User> messages = user.getMessages();
		if(operation == 0) {
			for(Message m : messages.keySet()) {
				if(m.getMessageID() == message.getMessageID()) {
					User mapUser = messages.get(m);
					messages.remove(m);
					messages.put(message,mapUser);
					break;
				}
			}
		}
		else if(operation == 1) {
			for(Message m : messages.keySet()) {
				if(m.getMessageID() == message.getMessageID()) {
					messages.remove(m);
					break;
				}
			}

		}
		
		user.setMessages(messages);
		session.setAttribute("currentUser",user);
		return true;
		
	}
	

}
