/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uts.wsd;

import java.io.*;
import javax.xml.bind.*;

public class StudentApplication implements Serializable {

    private String filePath;
    private Students students;

    public StudentApplication() {
        // TODO Auto-generated constructor stub
    }

    public StudentApplication(String filePath, Students students) {
        super();
        this.filePath = filePath;
        this.students = students;
    }

    public String getFilePath() {
        return filePath;
    }

    public void setFilePath(String filePath) throws Exception {
       
        JAXBContext jc = JAXBContext.newInstance(Students.class);
        Unmarshaller u = jc.createUnmarshaller();
        this.filePath = filePath;        
        FileInputStream fin = new FileInputStream(filePath);
        students = (Students) u.unmarshal(fin); 	
        fin.close();
    }

    public void updateXML(Students students, String filePath) throws Exception {
        this.students = students;
        this.filePath = filePath;
        JAXBContext jc = JAXBContext.newInstance(Students.class);
        Marshaller m = jc.createMarshaller();
        m.setProperty(Marshaller.JAXB_FORMATTED_OUTPUT, true);
        FileOutputStream fout = new FileOutputStream(filePath);
        m.marshal(students, fout);
        fout.close();
    }
   
    public void saveStudents() throws JAXBException, IOException {
        JAXBContext jc = JAXBContext.newInstance(Students.class);
        Marshaller m = jc.createMarshaller();
        m.setProperty(Marshaller.JAXB_FORMATTED_OUTPUT, true);
        FileOutputStream fout = new FileOutputStream(filePath);
        m.marshal(students, fout);
        fout.close();
    }

    public Students getStudents() {
        return students;
    }

    public void setStudents(Students students) {
        this.students = students;
    }
    
    public void editStudent(Student student, String name, String email, String password, String dob, String favcol) throws Exception{
        students.remove(student);
        student.updateDetails(name, email, password, dob, favcol);
        students.addStudent(student);
        updateXML(students,filePath);
    }
}//end class 
