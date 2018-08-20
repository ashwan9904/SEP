/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uts.wsd;

import javax.xml.bind.annotation.*;
import java.io.Serializable;

/**
 *
 * @author George
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlRootElement(name = "student")
public class Student implements Serializable {

    @XmlElement(name = "ID")
    private String ID;
    @XmlElement(name = "email")
    private String email;
    @XmlElement(name = "name")
    private String name;
    @XmlElement(name = "password")
    private String password;
    @XmlElement(name = "dob")
    private String dob;
    @XmlElement(name = "favoriteColor")
    private String favcol;

    public Student(String ID, String name, String email,String password,String dob,String favcol) {
        this.name = name;
        this.email = email;
        this.password = password;
        this.dob = dob;
        this.favcol = favcol;        
        this.ID = ID;
    }

    public Student() { }
    
    public void updateDetails(String name, String email, String password, String dob, String favcol){
        this.name = name;
        this.email = email;
        this.password = password;
        this.dob = dob;
        this.favcol = favcol;   
    }

    public boolean matchID(String ID){
        return this.ID.equals(ID.trim());
    }
    
    public boolean matchPassword(String password){
        return this.password.equals(password.trim());
    }
    
    public String getDob() {
        return dob;
    }

    public void setDob(String dob) {
        this.dob = dob;
    }

    public String getFavcol() {
        return favcol;
    }

    public void setFavcol(String favcol) {
        this.favcol = favcol;
    }
    
    public String getID() {
        return ID;
    }

    public void setID(String ID) {
        this.ID = ID;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}//end class
