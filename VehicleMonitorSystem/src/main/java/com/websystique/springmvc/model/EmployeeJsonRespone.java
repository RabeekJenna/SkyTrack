package com.websystique.springmvc.model;

import java.util.Map;

public class EmployeeJsonRespone {
   private Trip employee;
   private boolean validated;
   private Map<String, String> errorMessages;

   public Trip getEmployee() {
      return employee;
   }

   public void setEmployee(Trip employee) {
      this.employee = employee;
   }

   public Map<String, String> getErrorMessages() {
      return errorMessages;
   }

   public void setErrorMessages(Map<String, String> errorMessages) {
      this.errorMessages = errorMessages;
   }

   public boolean isValidated() {
      return validated;
   }

   public void setValidated(boolean validated) {
      this.validated = validated;
   }
}
