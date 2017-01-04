package com.org.pojo;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
@Table(name = "DBA_USER")
public class DbaUser implements java.io.Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "DBA_ID")
    private int dba_id;
    @Column(name="DBA_NAME")
    private String dba_name;
    @Column(name="PASSWORD")
    private String password;

    public DbaUser(int dba_id, String dba_name, String password) {
        this.dba_id = dba_id;
        this.dba_name = dba_name;
        this.password = password;
    }

    public int getDba_id() {
        return dba_id;
    }

    public void setDba_id(int dba_id) {
        this.dba_id = dba_id;
    }

    public String getDba_name() {
        return dba_name;
    }

    public void setDba_name(String dba_name) {
        this.dba_name = dba_name;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}
