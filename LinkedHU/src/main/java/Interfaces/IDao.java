package Interfaces;

import java.util.List;

public interface IDao<T> {
	// All data access objects that will be used by this system will sign this paper(implement).
	List<T> fetchAll();
	boolean create(T t);
	T read(int id);
	boolean update(T t);
	boolean delete(T t);
}
