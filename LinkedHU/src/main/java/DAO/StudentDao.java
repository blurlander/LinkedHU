package DAO;
import java.util.List;

import Interfaces.IDao;
import Model.Student;
public class StudentDao implements IDao<Student> {

	@Override
	public List<Student> fetchAll() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean create(Student t) {
		// TODO Auto-generated method stub
		return true;
	}

	@Override
	public Student read(int id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean update(Student t) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean delete(Student t) {
		// TODO Auto-generated method stub
		return false;
	}
	
	

}
