/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uts.wsd;

import java.io.Serializable;
import javax.xml.bind.annotation.*;
import java.util.ArrayList;

/**
 *
 * @author George
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlRootElement(name = "students")
public class Students implements Serializable {

    @XmlElement(name = "student")
    private ArrayList<Student> list = new ArrayList<>();

    public ArrayList<Student> getList() {
        return list;
    }

    public void addStudent(Student student) {
        list.add(student);
    }

    public Student getStudent(String ID) {
        for (Student student : list) {
            if (student.matchID(ID)) {
                return student;
            }
        }
        return null;
    }

    public Student login(String ID, String password) {        
        for (Student student : list) {
            if (student.matchID(ID) && student.matchPassword(password)) {
                return student; 
            }
        }
        return null; 
    }

    public ArrayList<Student> getRemoveList(String ID){
        ArrayList<Student> removelist = new ArrayList<>();
        for(Student student:list)
            if(student.matchID(ID))
                removelist.add(student);
        return removelist;
    }
    
    public void remove(Student student) {
        list.removeAll(getRemoveList(student.getID()));
    }
    
    public void updateList(Student student){
        remove(student);
        addStudent(student);
    }
}//end class
