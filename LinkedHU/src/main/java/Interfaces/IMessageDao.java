package Interfaces;
import java.util.List;

import Model.Message;

public interface IMessageDao extends IDao<Message> {
	List<Message> fetchByUserID(int userID);
	int getLastCreatedMessageID();
}
