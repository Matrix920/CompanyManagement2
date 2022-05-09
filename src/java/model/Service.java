/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author Matrix
 */
public class Service {
    public int service_id;
    public int project_id;
    public String service_type;
    
    public static final String SERVICE_ID="service_id";
    public static final String PROJCET_ID=Project.PROJECT_ID;
    public static final String SERVICE_TYPE="service_type";

    public Service(int service_id, int project_id, String service_type) {
        this.service_id = service_id;
        this.project_id = project_id;
        this.service_type = service_type;
    }
    
    
}
